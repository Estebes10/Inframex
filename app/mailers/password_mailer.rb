class PasswordMailer < ApplicationMailer

  def password_mailer(email)
    @user = User.find_by(email: email)
    @email = @user.email if @user

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
