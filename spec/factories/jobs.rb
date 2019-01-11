FactoryBot.define do
  factory :job do
    name {Faker::Job.field}
    association(:blog)
    association(:concept)
    quantity {Faker::Number.decimal(2, 3)}
  end
end
