100.times do
  UserProject.create!(user_id: Faker::Number.between(1, 100), project_id: Faker::Number.between(1, 20))
end