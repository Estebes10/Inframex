class UserProjectsController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @users = User.where.not(id: UserProject.where(project_id: @project.id).map(&:user_id)).order(:role_id,:name,status: :desc)
  end

  def create
    @project = Project.find(params[:project_id])
    @users_in_project = params[:user_project]
    if(!@users_in_project.nil?)
      @users_in_project.each do |u|
        @user_project = UserProject.new(:project_id => @project.id, :user_id => u)
        if @user_project.save
          flash[:success] = "Usuario(s) añadidos al proyecto!"
        else
          flash[:danger] = "Error al intentar guardar los usuarios en este proyecto. Intentelo más tarde."
        end
      end
    else
      flash[:danger] = "No se han seleccionado usuarios"
    end
    redirect_to project_path(@project , :anchor => "nav-users")
  end

  def destroy
    @idProject = params[:project_id]
    @idUser = params[:id]
    UserProject.where(user_id: @idUser, project_id: @idProject).delete_all
  end
end