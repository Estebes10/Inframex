FactoryBot.define do
  factory :concept do
    code             {Faker::Name.initials(6)}
    description      {Faker::Lorem.paragraph}
    quantity         {Faker::Number.decimal(3,2)}
    unity            {["m2", "kg", "L", "m"].sample}
    unit_price       {Faker::Number.between(from = 2.00, to = 100.00)}
    project_id       {Project.all.ids.sample}
    category_id      {Category.all.ids.sample}
  end
end
