json.extract! wall_message, :id, :group_id, :user_id, :content, :created_at, :updated_at
json.url wall_message_url(wall_message, format: :json)
