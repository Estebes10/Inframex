class RoleprivilegesController < ApplicationController

  # RBAC create
  before_action only: [:new, :create] do
    has_privilege_controller(current_user, 'rbac_3')
  end
  # RBAC destroy
  before_action only: [:destroy] do
    has_privilege_controller(current_user, 'rbac_5')
  end

  def new
    @role = Role.find(params[:idRole])
    @privileges = Privilege.where.not(id: Roleprivilege.where(role_id: @role.id).map(&:privilege_id))
  end

  def create
    @role = Role.find(params[:idRole])
    @idPrivileges = params[:privilege]
    if(!@idPrivileges.nil?)
      @idPrivileges.each do |p|
        @rolePrivilege = Roleprivilege.new(:role_id => @role.id, :privilege_id => p)
        if @rolePrivilege.save
          flash[:success] = "Privilegio(s) añadidos!"
        else
          flash[:danger] = "Error al intentar guardar los privilegios. Intentelo más tarde."
        end
      end
    else
      flash[:danger] = "No se han seleccionado privilegios"
    end
    redirect_to @role
  end

  def destroy
    @idRole = params[:idRole]
    @idPrivilege = params[:idPrivilege]
    Roleprivilege.where(role_id: @idRole, privilege_id: @idPrivilege).delete_all
  end

  private
  def set_role
    @role = Role.find(params[:idRole])
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
