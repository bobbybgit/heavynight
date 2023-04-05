class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  require 'bgg'
  include PollCheck

  def add
    if Game.all.mine(current_user.id).bgg_game(params[:bgg_id]) && (Game.all.mine(current_user.id).bgg_game(params[:bgg_id]) != [])
      game = Game.all.mine(current_user.id).bgg_game(params[:bgg_id])
      pp game
      game[0].destroy
    end
    @game = Game.new
    @game[:bgg_id] = params[:bgg_id]
    @game[:rating] = params[:rating]
    @game[:min_player_count] = params[:min_player_count]
    @game[:max_player_count] = params[:max_player_count]
    @game[:min_rec_player_count] = params[:min_rec_player_count]
    @game[:max_rec_player_count] = params[:max_rec_player_count]
    @game[:image] = params[:image]
    @game[:weight] = params[:weight]
    @game[:description] = params[:description]
    @game[:owned] = params[:owned]
    @game[:user_id] = current_user.id
    @game[:name] = params[:name]

    frame_id = "frame#{@game.bgg_id}"
    
    respond_to do |format|
      if @game.save
        format.html { redirect_to confirm_games_path(frame_id: frame_id), :data => {"turbo-frame" => frame_id} }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity, :data => {"turbo-frame" => "content"} }
        format.json { render json: @game.errors, status: :unprocessable_entity, :data => {"turbo-frame" => "content"}  }
      end
    end
  end 

  def index
    @my_groups = Group.all.mine(current_user.id).order(:name)
  end

  def multi_add
    bgg_user = params[:bgg_user]
    collection = Bgg::Collection.find_by_username(params[:bgg_user])
    game_ids = (collection.boardgames & collection.owned).sort{ |a,b| a.name <=> b.name }.map(&:id) - Game.all.owned_by_user(current_user.id).map(&:bgg_id)
    games_obj_to_add = BggApi.thing({id:"#{game_ids[0]},#{game_ids}"})["item"]
    games_to_add = []
    already_owned = Game.all.mine(current_user.id)
    if PresenceCheck.array(games_obj_to_add)
      games_obj_to_add.each do |game|
        owned_check = already_owned.select{|g| g.id == game["id"]}
        game_rating = "Not Rated"
        if PresenceCheck.array(owned_check)
          pp "#{ownedcheck.name} owned"
          game_rating = owned_check[0].rating
          owned_check.destroy
        end
        game_to_add = Game.create(
          bgg_id: game["id"],
          rating: game_rating,
          min_player_count: game["minplayers"][0]["value"],
          max_player_count: game["maxplayers"][0]["value"],
          min_rec_player_count: PollCheck.players(game).min,
          max_rec_player_count: PollCheck.players(game).max,
          image: game["image"],
          description: game["description"],
          owned: true,
          user_id: current_user.id,
          name: game["name"][0]["value"]
        )
      end
      @status = "Games Added"
    else
      @status = "No Games to Add"
    end
  end




    


  # GET /games or /games.json
  def results
    @my_games = Game.all.mine(current_user.id).owned_by_me
    @my_rated_games = Game.all.mine(current_user.id).rated_by_me
    @games = []
    search_results = []
    @error = nil
    game_ids = []
    @button = params[:button]
    case @button
    when "my"
      pp "my button"
      case params[:my]
      when "My Owned Games"
        game_ids = @my_games.sort { |a,b| a.name <=> b.name }.map(&:bgg_id)
      when "My Rated Games"
        game_ids = @my_rated_games.sort { |a,b| a.name <=> b.name }.map(&:bgg_id)
      when "All Games"
        @error = "Please use submit button of relevant filter"
      end
    when "bgg_game"
      pp "bgg game button"
      if (params[:bgg_game] && (params[:bgg_game] != ""))
        pp "game search"
        search_results =  Bgg::Search.query(params[:bgg_game])
        if (search_results.count < 1000) &&  (search_results.count > 1)
          expansion_ids = search_results.select { |result| result.type != 'boardgame'}.map(&:id)
          search_results.reverse_each do |result|
            search_results.delete(result) if expansion_ids.include?(result.id)
          end
          search_results.sort! { |a,b| a.name <=> b.name }
          game_ids = search_results.map(&:id)
        elsif search_results.count == 1
          game_ids.push(search_results[0].id)
        elsif search_results.count >= 1000
          @error = "Too many results generated, please use a more specific search term"
          return
        end
      end
    when "bgg_user"
      if (PresenceCheck.string(params[:bgg_user]))
        collection = Bgg::Collection.find_by_username(params[:bgg_user])
        @bgg_user = params[:bgg_user]
        pp @bgg_user
        if PresenceCheck.array(collection)
          game_ids = (collection.boardgames & collection.owned).sort{ |a,b| a.name <=> b.name }.map(&:id)
        else
          @error = "BGG User does not exist"
          return
        end
      else
        @error = "BGG User does not exist"
        return
      end
    when "hn_group"
      user_ids = User.all.members(params[:group]).map(&:id)
      game_ids = Game.all.owned_by_user(user_ids).map(&:bgg_id)
      pp game_ids
    end
      game_ids.count > 0 ? @games = BggApi.thing({id:"#{game_ids[0]},#{game_ids}"})["item"] : @error = "No Games Found"
  end

  # GET /games/1 or /games/1.json
  def show
  end

 

  def filter
    
  end

  def table
    @button = "my" if params[:my_button]
    @button = "hn_group" if params[:hn_group_button]
    @button = "bgg_user" if params[:bgg_user_button]
    @button = "bgg_game" if params[:bgg_game_button]

    pp @button

    
  end

  def confirm

    @frame_id = params[:frame_id]

    pp @frame_id
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
  
    @game = Game.new

    respond_to do |format|
      if @game.save
        format.html { redirect_to confirm_game_path, :data => {:turbo-frame => "modal"} }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity, :data => {:turbo-frame => "content"} }
        format.json { render json: @game.errors, status: :unprocessable_entity, :data => {:turbo-frame => "content"}  }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:bgg_id, :min_player_count, :max_player_count, :min_rec_player_count, :max_rec_player_count, :image, :weight, :rating, :description, :user_id, :venue_id, :owned)
    end
end
