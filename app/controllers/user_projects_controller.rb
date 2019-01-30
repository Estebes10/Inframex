class UserProjectsController < ApplicationController

  def new
    puts params
    @project = Project.find(params[:project_id])
    @users = UserProject.where.not(id: UserProject.where(project_id: @project.id).map(&:user_id))
  end

  def create
    @project = Project.find(params[:id])
  end

  def destroy
    @idProject = params[:project_id]
    @idUser = params[:id]
    UserProject.where(user_id: @idUser, project_id: @idProject).delete_all
  end
end