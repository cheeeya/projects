json.array! @gifts do |gift|
  # json.title gift.title
  # json.description gift.description
  json.partial! 'api/gifts/gift', gift: gift
end
