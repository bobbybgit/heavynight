class MembershipsController < ApplicationController

    def new 
            
          respond_to do |format|
          if @membership.save
            format.html { redirect_to group_url(group), notice: "You have joined #{group.name}." }
            format.json { render "groups/#{params[:group_id]}", status: :created, location: @group }
          else
            format.html { render "groups/#{params[:group_id]}", status: :unprocessable_entity }
            format.json { render json: @membership.errors, status: :unprocessable_entity }
          end
        end
      end
    end

      def destroy
        @membership = Membership.find_by id: params[:id]
        group = Group.find_by id: params[:group_id]

        @membership.destroy

        respond_to do |format|
          format.html { redirect_to group_url(group), notice: "You have left #{group.name}." }
          format.json { head :no_content }
        end
      end

      def membership_params
        params.require(:membership).permit(:group_id, :user_id, :admin)
      end


end
