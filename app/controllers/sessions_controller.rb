class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to users_url
    else
      render 'new'
    end
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      # flash[:success] = 'Bienvenido, sesión iniciada'
      redirect_to users_url
    else
      flash[:danger] = 'Datos de usuario incorrectos'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
