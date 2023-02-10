class ApplicationController < ActionController::Base

  def cities
    @country = params[:country]
    @region = params[:region]
    puts CS.cities(CS.states(CS.countries.key(@country)).key(@region),CS.countries.key(@country))
    render json: CS.cities(CS.states(CS.countries.key(@country)).key(@region),CS.countries.key(@country)).to_json
  end

  def regions
    @country = params[:country]
    puts CS.states(CS.countries.key(@country)).values
    render json: CS.states(CS.countries.key(@country)).values.to_json
  end

end
