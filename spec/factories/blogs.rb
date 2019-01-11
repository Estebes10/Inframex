FactoryBot.define do
  factory :blog do
    sequence(:name) { |n| "bitacora #{n}" }
    description {Faker::Lorem.paragraph}
    date        {Faker::Date.between(200.days.ago, 200.days.after)}
    status      {Faker::Boolean.boolean}
    sequence(:comments) { |n| "Comentario #{n}: " + Faker::Lorem.paragraph}
    # association(:project)
    project_id {Faker::Number.between(1, Project.all.length)}
  end
end
