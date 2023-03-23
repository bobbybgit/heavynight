class SessionsController < ApplicationController
  before_action :set_session, only: %i[ show edit update destroy ]

  # GET /sessions or /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1 or /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions or /sessions.json
  def create
    @session = Session.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to session_url(@session), notice: "Session was successfully created.", data:{turbo-frame: "content"} }
        format.json { render :show, status: :created, location: @session, data:{turbo-frame: "content"} }
      else
        format.html { render :new, status: :unprocessable_entity, data:{turbo-frame: "content"} }
        format.json { render json: @session.errors, status: :unprocessable_entity, data:{turbo-frame: "content"} }
      end
    end
  end

  # PATCH/PUT /sessions/1 or /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to session_url(@session), notice: "Session was successfully updated.", data:{turbo-frame: "content"} }
        format.json { render :show, status: :ok, location: @session, data:{turbo-frame: "content"} }
      else
        format.html { render :edit, status: :unprocessable_entity, data:{turbo-frame: "content"} }
        format.json { render json: @session.errors, status: :unprocessable_entity, data:{turbo-frame: "content"} }
      end
    end
  end

  # DELETE /sessions/1 or /sessions/1.json
  def destroy
    @session.destroy

    respond_to do |format|
      format.html { redirect_to sessions_url, notice: "You have been logged out", data:{turbo-frame: "content"} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:session).permit(:game_id, :event_id, :user_id, :slot_number, :max_slots)
    end
end
