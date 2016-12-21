json.extract! appointment, :id, :body, :season_id, :member_id, :announcament_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)