class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def index
    @users = User.all
  end

  def show
    @readonly = true
    @create = false
    @user = User.find(params[:id])
  end

  def new
    @readonly = false
    @create = true
    # @roles = Role.all
    @user = User.new
  end

  def create
    # @roles = Role.all
    @user = User.new(user_params)

    if @user.save
      flash[:success] = ' Éxito al crear el usuario'
      redirect_to @user
    else
      flash.now[:danger] = ' Error al crear el usuario'
      render action: 'new'
    end
  end

  def edit
    @readonly = false
    @create = false
    @user = User.find(params[:id])
    # @roles = Role.all
  end

  def update
    # @roles = Role.all
    if @user.update_attributes(user_params)
      flash[:success] = ' Usuario modificado correctamente'
      redirect_to user_url(@user)
    else
      flash[:error] = ' Error al modificar usuario'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = ' Se ha eliminado el usuario correctamente'
    redirect_to action: 'index'
  end

  def user_params
    params.require(:user).permit(
        :name,
        :lastName,
        :password,
        :password_confirmation,
        :birthday,
        :email,
        :status,
        :phone
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
