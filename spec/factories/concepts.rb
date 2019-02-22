FactoryBot.define do
  factory :concept do
    code             {Faker::Name.initials(6)}
    description      {Faker::Lorem.paragraph}
    quantity         {Faker::Number.decimal(3,2)}
    unity            {["m2", "kg", "L", "m"].sample}
    unit_price       {Faker::Number.between(from = 2.00, to = 100.00)}
    category_id      {Category.all.ids.sample}
    weight           @weight

    before(:create) do |concept|
      @project_id = Project.all.ids.sample
      @project = Project.find(@project_id)
      @missing_weight = (100 - @project.sum_all_concepts_weight)
      @weight = rand(0.01...@missing_weight).round(2)
      concept.project_id       = @project_id
      concept.weight           = @weight
    end
  end
end
