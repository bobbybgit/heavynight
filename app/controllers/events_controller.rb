class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  include GeoDistance

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @admin_of = Group.all.admin_of(current_user.id)
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        attendance = current_user.attendances.new(:event_id => @event.id)
        attendance.save
        format.html { redirect_to group_url(@event.group_id), data:{:turbo_frame => "content"}, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        @admin_of = Group.all.admin_of(current_user.id)
        format.html { render :new, data:{:turbo_frame => "content"}, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def table
    
  end

  def results
    
    params[:archived] ? @events = Event.group_name_search(params[:search_string]) : @events = Event.group_name_search(params[:search_string]).upcoming
    
    pp @events
    if params[:my] == "Events I'm Attending"
      @events = @events.joins(:users).where(users:{id: current_user.id})
    elsif params[:my] == "Events I'm Running"
      @events = @events.joins(:group).select{|event| event.group.admin_status(current_user)}
    end
    if (PresenceCheck.string(params[:loc_filter]))
      if !PresenceCheck.string(params[:longitude].to_s)
        @error = "Location not found, please use location matching autocomplete"
        return
      end
      @events = @events.select{|event| distance(event.group.latitude, event.group.longitude, params[:latitude].to_d, params[:longitude].to_d, "miles") <= params[:distance].to_d} 
    end
    @events = @events.sort_by{|event| event.date}
  end

  def filter
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :group_id, :venue_id, :date, :start_time, :duration, :event_setting_id, :session_id)
    end
end
