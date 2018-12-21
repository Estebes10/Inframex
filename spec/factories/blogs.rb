FactoryBot.define do
  factory :blog do
    sequence(:name) { |n| "bitacora #{n} for this project" }
    description {Faker::Lorem.paragraph}
    blog_date   {Faker::Date.between(10.days.ago, 10.days.after)}
    status      {true}
  end
end
