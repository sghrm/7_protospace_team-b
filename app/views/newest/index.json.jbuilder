json.array! @prototypes do |prototype|
  json.id prototype.id
  json.title prototype.title
  json.catch_copy prototype.catch_copy
  json.concept prototype.concept
  json.user_id prototype.user_id
  json.main prototype.set_main_thumbnail
  json.created_at prototype.created_at
end
