json.array! @searchItems do |item|
  json.id item.id
  json.name item.name
  json.user_id item.user_id
  json.image item.image
  json.url item.url
  json.term item.term
  json.user_sign_in current_user
end