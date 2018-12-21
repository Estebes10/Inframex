FactoryBot.define do
  factory :privilege do
    sequence(:name)  { |n| "Privilege #{n}" }
    description { "Privilegio de prueba" }
    module_name { "Privilege module"}
    str_id { "MyString" }
  end
end
