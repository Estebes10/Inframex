FactoryBot.define do
  factory :subcategory do
    sequence(:name) { |n| "Subcategoría #{n}" }
  end
end
