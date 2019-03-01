FactoryBot.define do
  factory :job do
    name             {Faker::Job.field}
    quantity         @quantity
    unity            {["m2", "kg", "L", "m"].sample}
    weight           @weight

    before(:create) do |job|
      @concept_id = Concept.all.ids.sample
      @quantity = Faker::Number.decimal(2,2)
      @concept = Concept.find(@concept_id)
      @missing_weight = (100 - @concept.sum_all_jobs_weight)
      @weight = rand(0.01...@missing_weight).round(2)
      job.concept_id       = @concept_id
      job.quantity         = @quantity
      job.weight           = @weight
    end
  end
end
