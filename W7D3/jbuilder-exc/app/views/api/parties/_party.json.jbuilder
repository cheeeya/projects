json.name party.name
json.location party.location
json.guests do
  json.array! party.guests do |guest|
    json.name guest.name
    json.age guest.age
  end
end
