json.extract! venue, :id, :capacity, :location_id, :private, :created_at, :updated_at
json.url venue_url(venue, format: :json)
