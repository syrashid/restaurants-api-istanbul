json.extract! @restaurant, :id, :name, :address
json.comments @restaurant.comments do |comment|
  json.extract! comment,  :content
  json.user_email comment.user.email
end
