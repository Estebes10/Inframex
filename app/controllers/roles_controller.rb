class RolesController < ApplicationController

  #RBAC show
  before_action only: [:index, :show] do
    has_privilege_controller(current_user, 'rbac_1')
  end

  #RBAC create
  before_action only: [:create, :new] do
    has_privilege_controller(current_user, 'rbac_2')
  end

  #RBAC edit
  before_action only: [:edit, :update] do
    has_privilege_controller(current_user, 'rbac_4')
  end

  #RBAC destroy
  before_action only: [:destroy] do
    has_privilege_controller(current_user, 'rbac_6')
  end
  
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
    @role = Role.new
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = ' Rol creado.'
      redirect_to :action => 'index'
    else
      flash[:danger] = " Rol no creado, Formato de nombre incorrecto. Caracteres no permitidos: `!@#$%^&*+="
      redirect_to roles_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @role.update_attributes(role_params)
      flash[:success] = " Nombre de Rol actualizado"
      redirect_to roles_path
    else
      flash[:danger] = " Rol no actualizado, formato de nombre incorrecto. Caracteres no permitidos: `!@#$%^&*+="
      redirect_to roles_path
    end
  end

  def destroy
    if(@role.users.count == 0)
      @role.privileges.destroy_all
      @role.destroy
    else
      flash[:info] = " No se pudo eliminar el rol. Existen usuarios con ese rol, asigna otro rol a esos usuarios e intentelo de nuevo."
      redirect_to roles_url
    end
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
