class PagesController < ApplicationController
    def dashboard
        @groups = User.find_by(id:current_user.id).groups
    end
end