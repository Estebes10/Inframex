FactoryBot.define do
  factory :supplier do
    sequence(:name) { |n| "Proveedor #{n} for this project" }
  end
end