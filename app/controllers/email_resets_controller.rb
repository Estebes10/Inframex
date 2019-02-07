class EmailResetsController < ApplicationController
  def new
  end

  def edit
  end

  def create
    @user = User.find_by(email: email_params[:email])
    @pass = SecureRandom.hex
    if @user
      if @user.update(password: @pass)
        PasswordMailer.with(email: @user.email, pass: @pass).password_mailer(@user.email, @pass).deliver_now
        flash[:success] = 'La contraseña ha sido cambiada, verifica tu correo'
      else
        flash[:danger] = 'No se pudo restaurar la contraseña, prueba otra vez'
      end
    else
      flash[:danger] = 'No existe un usuario con ese correo'
    end
    redirect_to root_url
  end

  private

  def email_params
    params.require(:email_reset).permit(:email)
  end
end
