json.array!(@users) do |user|
  json.extract! user, :first_name, :last_name, :email, :state, :password_digest, :remember_token, :admin
  json.url user_url(user, format: :json)
end