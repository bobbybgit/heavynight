class MembershipsController < ApplicationController

    def remove_admin
      @membership = Membership.find_by id: params[:id]
      @membership[:admin] = false
      @membership.save
      redirect_to group_url(Group.find_by_id(@membership[:group_id]))
    end

    def add_admin
      @membership = Membership.find_by id: params[:id]
      @membership[:admin] = true
      @membership.save
      redirect_to group_url(Group.find_by_id(@membership[:group_id])), data:{turbo_frame: "content"}
    end

    def new 
      @membership = current_user.memberships.new(:group_id => params[:group_id])
      group = Group.find_by id: params[:group_id]     
      respond_to do |format|
        if @membership.save
          format.html { redirect_to group_url(group), data:{turbo_frame: "content"}, notice: "You have joined #{group.name}." }
          format.json { render "groups/#{params[:group_id]}", status: :created, location: @group }
        else
          format.html { render "groups/#{params[:group_id]}", data:{turbo_frame: "content"}, status: :unprocessable_entity }
          format.json { render json: @membership.errors, status: :unprocessable_entity }
        end
      end
    end
    

      def destroy
        @membership = Membership.find_by id: params[:id]
        group = Group.find_by id: params[:group_id]

        @membership.destroy

        group.destroy if group.member_count == 0

        respond_to do |format|
          format.html { redirect_to group_url(group), notice: "You have left #{group.name}."  }
          format.json { head :no_content }
        end
      end

      def membership_params
        params.require(:membership).permit(:group_id, :user_id, :admin)
      end


end
