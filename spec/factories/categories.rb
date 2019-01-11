FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Categoría #{n}" }
  end
end
