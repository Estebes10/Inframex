class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  before_action :set_categories, only: [:show, :new, :index, :edit]

  #RBAC index
  before_action only: [:show, :index] do
    has_privilege_controller(current_user, 'project_1')
  end

  #RBAC create
  before_action only: [:create, :new] do
    has_privilege_controller(current_user, 'project_2')
  end

  #RBAC edit
  before_action only: [:edit, :update] do
    has_privilege_controller(current_user, 'project_3')
  end

  #RBAC destroy
  before_action only: [:destroy_ajax] do
    has_privilege_controller(current_user, 'project_4')
  end


  def index
    @projects = Project.order(:id)
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
    if @project.blogs.count > 0
      @project.blogs.each do | blog |
        if blog.jobs.count > 0
          blog.jobs.destroy_all
        else
          blog.destroy
        end
      end
      @project.destroy
    else
      @project.destroy
    end
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

  def set_categories
    @categories = Category.order(:name).all
  end

end
