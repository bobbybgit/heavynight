class EventSettingsController < ApplicationController
  before_action :set_event_setting, only: %i[ show edit update destroy ]

  # GET /event_settings or /event_settings.json
  def index
    @event_settings = EventSetting.all
  end

  # GET /event_settings/1 or /event_settings/1.json
  def show
  end

  # GET /event_settings/new
  def new
    @event_setting = EventSetting.new
  end

  # GET /event_settings/1/edit
  def edit
  end

  # POST /event_settings or /event_settings.json
  def create
    @event_setting = EventSetting.new(event_setting_params)

    respond_to do |format|
      if @event_setting.save
        format.html { redirect_to event_setting_url(@event_setting), notice: "Event setting was successfully created." }
        format.json { render :show, status: :created, location: @event_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_settings/1 or /event_settings/1.json
  def update
    respond_to do |format|
      if @event_setting.update(event_setting_params)
        format.html { redirect_to event_setting_url(@event_setting), notice: "Event setting was successfully updated." }
        format.json { render :show, status: :ok, location: @event_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_settings/1 or /event_settings/1.json
  def destroy
    @event_setting.destroy

    respond_to do |format|
      format.html { redirect_to event_settings_url, notice: "Event setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_setting
      @event_setting = EventSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_setting_params
      params.require(:event_setting).permit(:group_id, :event_id, :min_per_session, :max_per_session, :max_weight, :min_weight, :max_length, :min_length, :use_rec_count)
    end
end
