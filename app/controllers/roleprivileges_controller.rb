class RoleprivilegesController < ApplicationController
  def new
    @role = Role.find(params[:idRole])
    @privileges = Privilege.where.not(id: Roleprivilege.where(role_id: @role.id).map(&:privilege_id))
  end

  def create
    @role = Role.find(params[:idRole])
    @idPrivileges = params[:privilege]
    if(@idPrivileges.count > 0)
      @idPrivileges.each do |p|
        @rolePrivilege = Roleprivilege.new(:role_id => @role.id, :privilege_id => p)
        if @rolePrivilege.save
          flash[:success] = "Privilegio(s) añadidos!"
        else
          flash[:error] = "Error al intentar guardar los privilegios. Intentelo más tarde."
        end
      end
    else
      flash[:error] = "No se han seleccionado privilegios"
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
