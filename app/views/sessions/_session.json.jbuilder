json.extract! session, :id, :game_id, :event_id, :user_id, :slot_number, :max_slots, :created_at, :updated_at
json.url session_url(session, format: :json)
