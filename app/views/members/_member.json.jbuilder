json.extract! member, :id, :fname, :lname, :phone_number, :membership_type_id, :created_at, :updated_at
json.url member_url(member, format: :json)
