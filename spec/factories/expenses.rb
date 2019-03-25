FactoryBot.define do
  factory :expense do
    sequence(:name)  { |n| "Gasto #{n}" }
    date             {Faker::Date.between(100.days.ago, 100.days.after)}
    unity            {["m2", "kg", "L", "m"].sample}
    unit_price       {Faker::Number.between(from = 2.00, to = 100.00)}
    quantity         {Faker::Number.decimal(2,2)}
    status           {Faker::Boolean.boolean}
    iva              {Faker::Boolean.boolean}
    status_ticket    {Faker::Boolean.boolean}
    supplier_id      {Supplier.all.ids.sample}
    subcategory_id   {Subcategory.all.ids.sample}

    before(:create) do |expense|
      @concept_id = Concept.all.ids.sample
      @concept = Concept.find(@concept_id)
      @blog_id = @concept.project.blogs.ids.sample
      expense.concept_id = @concept_id
      expense.blog_id    = @blog_id
    end
  end
end
