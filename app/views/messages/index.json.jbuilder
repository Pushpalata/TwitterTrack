json.array!(@messages) do |message|
  json.extract! message, :id, :message, :uid, :from_user
  json.url message_url(message, format: :json)
end
