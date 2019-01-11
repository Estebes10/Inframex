if !User.find_by(email: 'super@admin.com')
  users_admin = User.create!({
                                 name: 'Super',
                                 lastName: 'Administrador',
                                 password: 'adminpassword',
                                 password_confirmation: 'adminpassword',
                                 birthday: '1970-08-08',
                                 email: 'super@admin.com',
                                 phone: '4421234567',
                                 status: true,
                                 role_id: 1
                             })
end

100.times do
  FactoryBot.create(:user)
end

