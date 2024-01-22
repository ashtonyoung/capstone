# app/views/users/index.json.jbuilder

json.array! @users.each do |user|
  json.attributes! user.keys
end

# json.attributes! user.attributes.keys