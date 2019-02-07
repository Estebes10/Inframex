class UsersController < ApplicationController

  #RBAC show
  before_action only: [:index, :show] do
    has_privilege_controller(current_user, 'user_1')
  end

  #RBAC create
  before_action only: [:new, :create] do
    has_privilege_controller(current_user, 'user_2')
  end

  #RBAC edit
  before_action only: [:edit, :update] do
    has_privilege_controller(current_user, 'user_3')
  end

  #RBAC destroy
  before_action only: [:destroy] do
    has_privilege_controller(current_user, 'user_4')
  end

  #RBAC activate
  before_action only: [:activate] do
    has_privilege_controller(current_user, 'user_5')
  end

  before_action :validate_user
  before_action :set_perfil, only: [:perfil, :edit_perfil, :update_perfil]
  before_action :set_user, only: [:edit, :update, :show, :destroy, :activate]

  def index
    @users = User.all
  end

  def show
    @readonly = true
    @create = false
    @roles = Role.all
    @role_id = @user.role.id
    @required_str = ""
  end

  def new
    @readonly = false
    @create = true
    @roles = Role.all
    @user = User.new
    @role_id = 0
    @required_str = "* "
  end

  def create
    @user = User.new(user_params)
    @pass = SecureRandom.hex
    @user.password = @pass
    @user.password_confirmation = @pass
    if @user.save
      flash.now[:success] = ' Éxito al crear el usuario'
      redirect_to @user
      PasswordMailer.with(email: @user.email, pass: @pass, name: @user.name)
                    .new_password_mailer(@user.email, @pass, @user.name).deliver_now
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
    @required_str = "* "
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

  def perfil
    @edit_perfil = false
    @readonly = true
    @required_str = ""
  end

  def edit_perfil
    @edit_perfil = true
    @readonly = false
    @required_str = ""
  end

  def update_perfil
    if @user.update_attributes(perfil_params)
      flash[:success] = ' Tus datos han sido modificados correctamente'
      redirect_to perfil_url
    else
      @readonly = false
      @create = false
      flash[:error] = ' Error al actualizar tus datos'
      render :edit_perfil
    end
  end

  private

  def user_params
    params.require(:user).permit(
        :name,
        :lastName,
        :birthday,
        :email,
        :status,
        :phone,
        :role_id
    )
  end

  def perfil_params
    params.require(:user).permit(
        :name,
        :lastName,
        :password,
        :password_confirmation,
        :birthday,
        :email,
        :phone,
    )
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_perfil
    @user = current_user
  end
end
