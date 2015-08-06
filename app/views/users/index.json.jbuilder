json.array!(@users) do |user|
  json.extract! user, :id, :name, :password, :email, :login_time
  json.url user_url(user, format: :json)
end
