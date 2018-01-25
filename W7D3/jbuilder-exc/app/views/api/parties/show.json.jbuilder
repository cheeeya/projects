json.name @party.name
json.location @party.location
json.guests do
  json.array! @party.guests do |guest|
    json.name guest.name
    json.gifts do
      json.array! guest.gifts do |gift|
        # json.title gift.title
        # json.description gift.description
        json.partial! 'api/gifts/gift', gift: gift
      end
    end
  end
end
