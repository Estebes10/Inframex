FactoryBot.define do
  factory :expense do
    association(:supplier)
    association(:subcategory)
    sequence(:name)  { |n| "Gasto #{n} for this project" }
    date             {Faker::Date.between(10.days.ago, 10.days.after)}
    sequence(:unity) { |n| "Unidad #{n} for this project"}
    unit_price       {Faker::Number.decimal(5,2)}
    total            {Faker::Number.decimal(7,2)}
    quantity         {Faker::Number.number(4)}
    status {true}
    status_ticket {true}
  end
end