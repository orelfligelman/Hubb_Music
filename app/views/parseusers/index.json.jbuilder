json.array!(@parseusers) do |parseuser|
  json.extract! parseuser, :id, :name, :email, :password
  json.url parseuser_url(parseuser, format: :json)
end
