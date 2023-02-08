json.extract! location, :id, :street, :city, :region, :country, :code, :latitude, :longitude, :created_at, :updated_at
json.url location_url(location, format: :json)
