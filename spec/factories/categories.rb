FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Categoría #{n} for this project" }
  end
end
