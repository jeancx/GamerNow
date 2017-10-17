json.array!(@users) do |user|
  json.extract! user, :name, :description, :photo, :cover, :birthday, :gender, :email, :encrypted_password, :current_sign_in_ip, :last_sign_in_ip
  json.url user_url(user, format: :json)
end