json.array!(@providers) do |provider|
  json.extract! provider, :id, :last_name, :first_name, :title, :address1, :address2, :city, :state, :postal_code, :country, :years_of_experience, :category, :specialty
  json.url provider_url(provider, format: :json)
end
