class UserProjectsController < ApplicationController

  # Check if user belongs to project (also check if project exists)
  before_action do
    belongs_to_project_controller(current_user, params[:project_id])
  end

  before_action :set_project

  def index
    @tabs = "users"
    @users = @project.users.order(:role_id,:name).all
  end

  def new
    @users = User.where.not(id: UserProject.where(project_id: @project.id).map(&:user_id)).order(:role_id,:name,status: :desc)
  end

  def create
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
    redirect_to project_user_projects_path(@project)
  end

  def destroy
    @idUser = params[:id]
    UserProject.where(user_id: @idUser, project_id: @project.id).delete_all
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end