json.extract! @gym, :name, :home_city, :id, :logo_url


json.workouts do
  json.array! @gym.workouts do |workout|
    json.name workout.name
    json.time workout.time
    json.date workout.date
    json.id workout.id
    json.user_id workout.user_id
    json.buddy_id workout.buddy_id
    json.username workout.user.username
  end
end
