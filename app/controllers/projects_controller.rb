class ProjectsController < ApplicationController

  before_action :set_project, only: [:edit, :update, :show, :destroy]

  def index
    @projects = Project.all.order(:id)
  end

  def new
    @readonly = false
    @create = true
    @project = Project.new
  end

  def show
    @readonly = true
    @create = false
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = ' Éxito al crear el proyecto'
      redirect_to @project
    else
      flash.now[:danger] = ' Error al el proyecto'
      @readonly = false
      @create = true
      render :action => 'new'
    end
  end

  def edit
    @readonly = false
    @create = false
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = ' Proyecto modificado correctamente'
      redirect_to project_url(@project)
    else
      flash[:error] = ' Error al modificar el proyecto'
      render :edit
    end
  end

  def destroy
    @project.destroy
  end

  private

  def project_params
      params.require(:project).permit(
        :name,
        :code,
        :start_date,
        :due_date,
        :client,
        :address,
        :status
      )
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
