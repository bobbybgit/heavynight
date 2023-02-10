class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    params[:final_submit] = "NoSub"
    @group = Group.new
    # collect_form_data
  end

  # GET /groups/1/edit
  def edit
    params[:final_submit] = "NoSub"
    ##collect_form_data
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    # collect_form_data

    respond_to do |format|
      if @group.save && params[:final_submit] == "Submit"
        format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      elsif !@group.save
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      else
        format.html {redirect_to edit_group_url(@group)}
      end

    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params) && params[:final_submit] == "Submit"
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      elsif !@group.save
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      else
        format.html {redirect_to edit_group_url(@group)}
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # def collect_form_data
  #  if @group.country
  #    @country = @group.country
  #  else
  #    @group.country = "GB"
  #    @country = @group.country
  #  end
  #  @regions = CS.states(@group.country)
  #  @cities = CS.cities(@group.country, @group.city) if @group.city || @cities = @CS.cities(@)

  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name,:country, :city, :location_id, :description, :private, :event_setting_id)
    end
end

