json.array!(@users) do |user|
  json.extract! user, :id, :username, :crypted_password, :salt, :pb_id, :pb_pw
  json.url user_url(user, format: :json)
end
