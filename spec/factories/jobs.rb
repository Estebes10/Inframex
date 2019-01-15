FactoryBot.define do
  factory :job do
    name             {Faker::Job.field}
    quantity         {Faker::Number.decimal(2,2)}

    before(:create) do |job|
      @concept_id = Concept.all.ids.sample
      @quantity = Faker::Number.decimal(2,2)
      @concept = Concept.find(@concept_id)
      if (@concept.quantity - @concept.sum_all_jobs_quantity) < @quantity.to_d
        @quantity = Faker::Number.decimal(1,2)
      end
      @blog_id = @concept.project.blogs.ids.sample
      job.concept_id       = @concept_id
      job.blog_id          = @blog_id
      job.quantity         = @quantity
    end
  end
end
