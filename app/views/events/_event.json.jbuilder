json.extract! event, :id, :name, :group_id, :venue_id, :date, :start_time, :end_time, :event_setting_id, :session_id, :created_at, :updated_at
json.url event_url(event, format: :json)
