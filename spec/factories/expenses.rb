FactoryBot.define do
  factory :expense do
    sequence(:name)  { |n| "Gasto #{n}" }
    date             {Faker::Date.between(100.days.ago, 100.days.after)}
    unity            {["m2", "kg", "L", "m"].sample}
    unit_price       {Faker::Number.decimal(5,2)}
    quantity         {Faker::Number.decimal(3,2)}
    status           {Faker::Boolean.boolean}
    status_ticket    {Faker::Boolean.boolean}
    supplier_id      {Faker::Number.between(1, Supplier.all.length)}
    subcategory_id   {Faker::Number.between(1, Subcategory.all.length)}
    concept_id       {Faker::Number.between(1, Concept.all.length)}
    blog_id          {Faker::Number.between(1, Blog.all.length)}
  end
end