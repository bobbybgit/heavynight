class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  require 'bgg'


  def add
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
    @game = Game.new
    @search_results =  Bgg::Search.query(params[:search_string])
    @search_results_games = @search_results
    @search_results.reverse_each do |result|
      if result.type != "boardgame"
        @search_results_games.reverse_each do |game|
          if game.id == result.id
             @search_results_games.delete(game)
          end
        end
      end
    end
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
