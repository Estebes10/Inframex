class UsersController < ApplicationController
  before_action :validate_user
  before_action :set_user, only: [:edit, :update, :show, :destroy, :activate]

  def index
    @users = User.all
  end

  def show
    @readonly = true
    @create = false
    @roles = Role.all
    @role_id = @user.role.id
  end

  def new
    @readonly = false
    @create = true
    @roles = Role.all
    @user = User.new
    @role_id = 0
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = ' Éxito al crear el usuario'
      redirect_to @user
    else
      flash.now[:danger] = ' Error al crear el usuario'
      @readonly = false
      @create = true
      @roles = Role.all
      @role_id = 0
      render :action => 'new'
    end
  end

  def edit
    @readonly = false
    @create = false
    @roles = Role.all
    @role_id = @user.role.id
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = ' Usuario modificado correctamente'
      redirect_to user_url(@user)
    else
      @readonly = false
      @create = false
      @roles = Role.all
      @role_id = @user.role.id
      flash[:error] = ' Error al modificar usuario'
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  def activate
    @user.update_attribute(:status, params[:data])
  end

  private

  def user_params
    params.require(:user).permit(
        :name,
        :lastName,
        :password,
        :password_confirmation,
        :birthday,
        :email,
        :status,
        :phone,
        :role_id
    )
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
