class ProjectsController < ApplicationController
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

  # Check if user belongs to project (also check if project exists)
  before_action only: [:edit, :update, :show, :destroy] do
    belongs_to_project_controller(current_user, params[:id])
  end

  before_action :set_project, only: [:edit, :update, :show, :destroy, :reports]
  before_action :set_categories, only: [:reports, :new, :edit]

  def index
    if has_privilege(current_user, 'project_7')
      @projects = Project.order(:id)
    else
      @projects = current_user.projects.order(:id)
    end
  end

  def new
    @readonly = false
    @create = true
    @project = Project.new
    @project.start_date = Time.now
    @project.due_date = Time.now
    @required_str = "* "
  end

  def show
    @readonly = true
    @create = false
    @required_str = ""
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
    @required_str = "* "
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = ' Proyecto modificado correctamente'
      redirect_to project_url(@project)
    else
      flash[:danger] = ' Error al modificar el proyecto'
      render :edit
    end
  end

  def destroy
    @project.destroy
  end

  def reports
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
        :status,
        :image
      )
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_categories
    @categories = Category.order(:name).all
  end

end
