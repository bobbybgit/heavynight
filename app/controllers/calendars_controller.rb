class CalendarsController < ApplicationController

  def calendar
    @date = params[:date].to_date
  end


end