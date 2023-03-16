class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  require 'bgg'


  def add
  end 

  def rate 
    @game = Bgg::Game.find_by_id(params[:game_id])
  end

  # GET /games or /games.json
  def index
    @games = Game.all.where(user_id:current_user.id, owned:true)
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    search_results = []
    @error = nil
    game_ids = []
    if (params[:bgg_game] && (params[:bgg_game] != ""))
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
    #@search_results_games = []
    #id_list = "#{game_ids.each{|id| "#{id}, "}}"
    #id_list = id_list[1..-2]
    pp game_ids.class
    if game_ids.count == 1
      @search_results_games = BggApi.thing({id:"#{game_ids[0]}"})["item"]
    else
      @search_results_games = BggApi.thing({id:"#{game_ids}"})["item"]
    end
    pp @search_results_games


  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
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
      params.require(:game).permit(:bgg_id, :min_player_count, :max_player_count, :min_rec_player_count, :max_rec_player_count, :image, :weight, :rating, :description, :user_id, :venue_id)
    end
end
