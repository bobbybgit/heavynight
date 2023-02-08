json.extract! event_setting, :id, :group_id, :event_id, :min_per_session, :max_per_session, :max_weight, :min_weight, :max_length, :min_length, :use_rec_count, :created_at, :updated_at
json.url event_setting_url(event_setting, format: :json)
