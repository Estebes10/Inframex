FactoryBot.define do
  factory :user_project do
    association(:user)
    association(:project)
    #user { nil }
    #project { nil }
  end
end
