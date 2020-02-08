json.extract! prospect, :id, :fname, :lname, :showed, :signed_up, :scheduled_date, :membership_type_id, :class_time_id, :created_at, :updated_at
json.url prospect_url(prospect, format: :json)
