class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  require 'bgg'
  include PollCheck


  def add
    if Game.all.mine(current_user.id,params[:bgg_id]) && (Game.all.mine(current_user.id,params[:bgg_id]) != [])
      game = Game.all.mine(current_user.id,params[:bgg_id])
      game.destroy
    end
@gan    @game = Game.new
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
    @game.save
  end 

  # GET /games or /games.json
  def index
    @my_games = Game.all.where(user_id:current_user.id, owned:true)
    @my_rated_games = Game.all.where(user_id:current_user.id).where.not(rating: nil)
    @games = []
    search_results = []
    @error = nil
    game_ids = []
    if params[:my] == "My Owned Games"
      pp "Owned"
      @games = @my_games
    elsif params[:my] == "My Rated Games"
      @games = @my_rated_games
    else
      pp "all"
      if (params[:bgg_game] && (params[:bgg_game] != ""))
        pp "game search"
        search_results =  Bgg::Search.query(params[:bgg_game])
        if (search_results.count < 1000) &&  (search_results.count > 1)
          expansion_ids = search_results.select { |result| result.type != 'boardgame'}.map(&:id)
          search_results.reverse_each do |result|
            search_results.delete(result) if expansion_ids.include?(result.id)
          end
          game_ids = search_results.map(&:id)
        elsif search_results.count == 1
          pp search_results.count
          pp search_results[0].id
          game_ids.push(search_results[0].id)
          pp game_ids
        elsif search_results.count >= 1000
          @error = "Too many results generated, please use a more specific search term"
        else
          @error = "No games found"
        end
      elsif (params[:bgg_user] && (params[:bgg_user] != ""))
        collection = Bgg::Collection.find_by_username(params[:bgg_user])
        owned = collection.owned
        games = collection.boardgames
        collection_array = owned & games
        game_ids = collection_array.map(&:id)
      end
      if game_ids.count == 1
        @games = BggApi.thing({id:"#{game_ids[0]}"})["item"]
      elsif game_ids.count > 1
        @games = BggApi.thing({id:"#{game_ids}"})["item"]
      end
    end
    pp @games
  end

  # GET /games/1 or /games/1.json
  def show
  end

 

  def filter
  end

  def table
  end

  def confirm
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
