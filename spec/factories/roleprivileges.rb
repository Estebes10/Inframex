FactoryBot.define do
  factory :roleprivilege do
    association(:role)
    association(:privilege)
  end
end
