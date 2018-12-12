FactoryBot.define do
  factory :job do
    name {Faker::Job.field}
    association(:blog)
  end
end
