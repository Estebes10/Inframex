FactoryBot.define do
  factory :job do
    name             {Faker::Job.field}
    concept_id       {Faker::Number.between(1, Concept.all.length)}
    blog_id          {Faker::Number.between(1, Blog.all.length)}
  end
end
