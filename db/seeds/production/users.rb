if !User.find_by(email: 'inframex.qro@gmail.com')
  users_admin = User.create!({
                                 name: 'Admin',
                                 lastName: 'Inframex',
                                 password: 'adminpassword',
                                 password_confirmation: 'adminpassword',
                                 birthday: Date.today - 20.years,
                                 email: 'inframex.qro@gmail.com',
                                 phone: '4421234567',
                                 status: true,
                                 role_id: 1
                             })
end
