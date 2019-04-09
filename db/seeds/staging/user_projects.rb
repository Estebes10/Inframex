40.times do
  UserProject.create!(user_id: Faker::Number.between(1, 30), project_id: Faker::Number.between(1, 5))
end
