FactoryBot.define do
  factory :concept do
    association(:category)
    association(:project)
    code             {Faker::Name.initials(6)}
    description      {Faker::Lorem.paragraph}
    quantity         {Faker::Number.decimal(3,2)}
    sequence(:unity) { |n| "Unidad #{n} for this concept"}
    unit_price       {Faker::Number.decimal(5,2)}
    total            {Faker::Number.decimal(7,2)}
  end
end