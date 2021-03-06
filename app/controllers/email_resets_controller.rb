class EmailResetsController < ApplicationController

  before_action :set_user, only: [:edit_password, :update_password]

  def new
  end

  def edit
  end

  def create
    @user = User.find_by(email: email_params[:email])
    if @user
      @user.create_reset_digest
      PasswordMailer.with(email: @user.email).password_mailer(@user.email).deliver_now
      flash[:success] = 'Sigue las instrucciones que se han mandado a tu correo, VERIFICA EL SPAM SI NO LLEGA A TU BANDEJA DE ENTRADA'
    else
      flash[:danger] = 'No existe un usuario con ese correo'
    end
    redirect_to root_url
  end

  def edit_password
    if current_user.present?
      log_out
    end
  end

  def update_password
    if params[:format] == @user.reset_digest
      if @user.update_attributes(password_params)
        redirect_to root_url
        flash[:success] = 'La contraseña ha sido modificada correctamente'
      else
        flash.now[:danger] = 'No se pudo restaurar la contraseña, prueba otra vez'
      end
    else
      flash[:danger] = 'Token no válido, verifica tu correo'
      redirect_to root_url
    end
  end

  private

  def set_user
    @user = User.find_by!(email: params[:email])
  end

  def email_params
    params.require(:email_reset).permit(:email)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
