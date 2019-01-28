FactoryBot.define do
  factory :job_progress do
    quantity         @quantity

    before(:create) do |job_progress|
      @job_id = Job.all.ids.sample
      @quantity = Faker::Number.decimal(1,2)
      @job = Job.find(@job_id)
      if (@job.quantity - @job.sum_all_job_progresses_quantity) < @quantity.to_d
        @quantity = Faker::Number.decimal(1,2)
      end
      @blog_id = @job.concept.project.blogs.ids.sample
      job_progress.job_id       = @job_id
      job_progress.blog_id          = @blog_id
      job_progress.quantity         = @quantity
    end
  end
end
