FactoryBot.define do
  factory :blog do
    sequence(:name) { |n| "bitacora #{n} for this project" }
    description {Faker::Lorem.paragraph}
    date        {Faker::Date.between(10.days.ago, 10.days.after)}
    status      {true}
    association(:project)
    sequence(:comments) { |n| "Comentario #{n} for this blog" }
  end
end
