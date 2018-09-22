json.array! @prototypes do |prototype|
  json.id prototype.id
  json.title prototype.title
  json.catch_copy prototype.catch_copy
  json.concept prototype.concept
  json.user_id prototype.user_id
  json.user_name prototype.user.name
  json.main prototype.set_main_thumbnail
  json.posted_date prototype.posted_date
end
