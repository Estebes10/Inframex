FactoryBot.define do
  factory :blob do
    sequence(:name) { |n| "bitacora #{n} for this project" }
    description Faker::Lorem.paragraph
    blob_date   Faker::Date.between(10.days.ago, 10.days.after)
    status      true
  end
end
