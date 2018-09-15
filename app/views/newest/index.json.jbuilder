json.array! @prototypes do |prototype|
  json.id prototype.id
  json.title prototype.title
  json.catch_copy prototype.catch_copy
  json.concept prototype.concept
  json.user_id prototype.user_id
  json.created_at message.created_at
end
