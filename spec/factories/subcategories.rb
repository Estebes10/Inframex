FactoryBot.define do
  factory :subcategory do
    sequence(:name) { |n| "Subcategoría #{n} for this project" }
  end
end
