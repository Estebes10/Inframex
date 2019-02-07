class PasswordMailer < ApplicationMailer

  def password_mailer(email, pass)
    @user = User.find_by(email: email)
    @pass = pass
    @email = @user.email if @user
    @url = 'https://inframx.herokuapp.com/'

    mail(to: @email, subject: 'Restauración de contraseña')
  end

  def new_password_mailer(email, pass, name)
    @pass = pass
    @name = name
    @email = email
    @url = 'https://inframx.herokuapp.com/'

    mail(to: @email, subject: 'Contraseña asignada')
  end
end
