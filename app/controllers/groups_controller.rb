class GroupsController < ApplicationController
include GeoDistance
require 'bigdecimal'
require 'bigdecimal/util'

  before_action :set_group, only: %i[ show edit update destroy ]

  
  # GET /groups or /groups.json
  def index
    @groups = Group.name_search(params[:search_string])
    @groups = @groups.joins(:users).where(users:{id: current_user.id}) if params[:my] == "My Groups"
    if ((params[:loc_filter] != "") && params[:loc_filter])
      @groups = @groups.select{|group| (distance(group.latitude, group.longitude, params[:latitude].to_d, params[:longitude].to_d, "miles") <= params[:distance].to_d)} 
    end
  end

  # GET /groups/1 or /groups/1.json
  def show
    @today = Date.today
    @date = Date.new(@today.year, @today.month, 1)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  
   
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
   
    respond_to do |format|
      if @group.save 
        membership = current_user.memberships.new(:group_id => @group.id)
        @group.users.count == 0? membership[:admin] = true : membership[:admin] = false
        membership.save
        format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else 
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else 
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
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

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name,:location, :longitude, :latitude, :description, :private, :image, :all)
    end
end

