json.extract! employee, :id, :fname, :lname, :created_at, :updated_at
json.url employee_url(employee, format: :json)
