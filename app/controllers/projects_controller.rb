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

  before_action only: [:general_reports] do
    has_privilege_controller(current_user, 'report_1')
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
    @tabs = "general"
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

  def general_reports
    @query = Hash.new
    @query[:progress] = Project.progress_by_project
    @query[:active_users] = User.total_active_users
    @query[:inactive_users] = User.total_inactive_users
    @query[:user_per_role] = User.user_by_role
    @query[:blogs_per_project] = Project.total_blogs_per_project
    @query[:expenses_per_project], @query[:estimated_costs] = Project.get_total_expenses_per_project
    @query[:global_expenses_per_category] = Project.global_expenses_per_category
    @query[:global_expenses_per_subcategory] = Project.global_expenses_per_subcategory
    @query[:expenses_per_day_by_range] = Expense.expenses_per_day_by_range
    @query[:top_suppliers] = Project.top_suppliers
    @query[:expenses_by_month] = Expense.expenses_by_month
    @query[:incomes_per_project] = Project.global_incomes
  end

  def reports
    if !has_privilege(current_user, 'project_8')
      redirect_to project_path(@project)
    end
    @tabs = "reports"
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
