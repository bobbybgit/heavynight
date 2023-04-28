class CalendarsController < ApplicationController

  def calendar
    @date = params[:date].to_date
    @group = Group.find_by_id(params[:group])
  end


end