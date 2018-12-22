FactoryBot.define do
  factory :privilege do
    sequence(:name)  { |n| "Privilege #{n}" }
    description { "Privilegio de prueba" }
    module_name { "Privilege module"}
    sequence(:str_id)  { |n| "Code #{n}" }
  end
end
