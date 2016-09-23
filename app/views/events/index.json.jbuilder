json.array!(@events) do |event|
  json.extract! event, :id, :client_id, :provider_id, :event_date, :description, :amount_paid, :has_insurance, :client_confirmed, :provider_confirmed
  json.url event_url(event, format: :json)
end
