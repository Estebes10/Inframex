FactoryBot.define do
  factory :income do
    sequence(:name)  { |n| "Ingreso #{n}" }
    quantity         {Faker::Number.decimal(2,2)}
    iva              {Faker::Boolean.boolean}
    payment_method   {["Efectivo", "Tarjeta de Crédito", "Tarjeta de Débito", "Cheque", "Transferencia Electrónica"].sample}
    person           {Faker::Name}
    date             {Faker::Date.between(100.days.ago, 100.days.after)}

    before(:create) do |income|
      @project_id = Project.all.ids.sample
      @project = Project.find(@project_id)
      income.project_id       = @project_id
    end
  end
end