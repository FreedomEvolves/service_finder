json.array!(@clients) do |client|
  json.extract! client, :id, :last_name, :first_name, :gender, :date_of_birth, :address2, :city, :state, :postal_code, :country
  json.url client_url(client, format: :json)
end
