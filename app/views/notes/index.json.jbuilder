json.array!(@notes) do |note|
  json.extract! note, :id, :event_id, :comment, :event_rating
  json.url note_url(note, format: :json)
end
