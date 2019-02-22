class PasswordMailer < ApplicationMailer

  def password_mailer(email)
    @user = User.find_by(email: email)
    @email = @user.email if @user

    mail(to: @email, subject: 'Restauración de contraseña', :importance => "High", 'X-Priority' => '1')
  end

  def new_password_mailer(email)
    @user = User.find_by(email: email)
    @email = @user.email if @user

    mail(to: @email, subject: 'Creación de cuenta - Inframex', :importance => "High", 'X-Priority' => '1')
  end
end
