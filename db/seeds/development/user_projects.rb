50.times do
  UserProject.create!(user_id: Faker::Number.between(1, 50), project_id: Faker::Number.between(1, 10))
end