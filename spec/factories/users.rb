FactoryBot.define do
  factory :user do
    name     {Faker::Name.first_name}
    lastName {Faker::Name.last_name}
    #password_digest {'contrasena'}
    password {"contrasena"}
    #password_confirmation {"password"}
    birthday {Faker::Date.between(40.years.ago, 20.years.ago)}
    email    {Faker::Internet.email}
    phone    {Faker::PhoneNumber.cell_phone}
    status   {true}
  end
end
