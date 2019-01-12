FactoryBot.define do
  factory :supplier do
    sequence(:name) { |n| Faker::Company.name + " #{n}" }
  end
end