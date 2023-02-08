class WallMessagesController < ApplicationController
  before_action :set_wall_message, only: %i[ show edit update destroy ]

  # GET /wall_messages or /wall_messages.json
  def index
    @wall_messages = WallMessage.all
  end

  # GET /wall_messages/1 or /wall_messages/1.json
  def show
  end

  # GET /wall_messages/new
  def new
    @wall_message = WallMessage.new
  end

  # GET /wall_messages/1/edit
  def edit
  end

  # POST /wall_messages or /wall_messages.json
  def create
    @wall_message = WallMessage.new(wall_message_params)

    respond_to do |format|
      if @wall_message.save
        format.html { redirect_to wall_message_url(@wall_message), notice: "Wall message was successfully created." }
        format.json { render :show, status: :created, location: @wall_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wall_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wall_messages/1 or /wall_messages/1.json
  def update
    respond_to do |format|
      if @wall_message.update(wall_message_params)
        format.html { redirect_to wall_message_url(@wall_message), notice: "Wall message was successfully updated." }
        format.json { render :show, status: :ok, location: @wall_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wall_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wall_messages/1 or /wall_messages/1.json
  def destroy
    @wall_message.destroy

    respond_to do |format|
      format.html { redirect_to wall_messages_url, notice: "Wall message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wall_message
      @wall_message = WallMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wall_message_params
      params.require(:wall_message).permit(:group_id, :user_id, :content)
    end
end
