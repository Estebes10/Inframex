FactoryBot.define do
  factory :user do
    name     {Faker::Name.first_name}
    lastName {Faker::Name.last_name}
    password {"contrasena"}
    password_confirmation {"contrasena"}
    birthday {Faker::Date.between(40.years.ago, 20.years.ago)}
    email    {Faker::Internet.email}
    phone    {Faker::PhoneNumber.cell_phone}
    status   {Faker::Boolean.boolean}
    role_id  {Role.all.ids.sample}
    # association(:role)
  end
end