FactoryBot.define do
  factory :concept do
    code             {Faker::Name.initials(6)}
    description      {Faker::Lorem.paragraph}
    quantity         {Faker::Number.decimal(4,2)}
    unity            {["m2", "kg", "L", "m"].sample}
    unit_price       {Faker::Number.decimal(5,2)}
    project_id       {Faker::Number.between(1, Project.all.length)}
    category_id      {Faker::Number.between(1, Category.all.length)}
  end
end
