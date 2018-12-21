FactoryBot.define do
  factory :project do
    name       {Faker::App.name}
    sequence(:code)  { |n| "P0000#{n}" }
    address    {Faker::Address.full_address}
    start_date {Faker::Date.between(1.year.ago, Date.today)}
    due_date   {Faker::Date.between(10.days.from_now, 1.year.from_now)}
    client     {Faker::Company.name}
    status     {true}
  end
end
