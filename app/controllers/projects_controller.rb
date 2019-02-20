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
  
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  before_action :set_categories, only: [:show, :new, :index, :edit]

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
    @required_str = "* "
  end

  def show
    @users = @project.users.order(:role_id,:name).all
    @readonly = true
    @create = false
    @required_str = ""
    expenses_filter
    blogs_filter
  end

  def blogs_filter
    if has_privilege(current_user, 'blog_7')
      @blogs = @project.blogs.where(status: true).all
    else
      @blogs = @project.blogs.all
    end
  end

  def expenses_filter
    @expenses = []
    if has_privilege(current_user, 'expenses_9')
      @project.blogs.each do |blog|
        blog.expenses.where(status: true).each do |expense|
          @expenses.push(expense)
        end
      end
    else
      @project.blogs.each do |blog|
        blog.expenses.each do |expense|
          @expenses.push(expense)
        end
      end
    end
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

  def set_categories
    @categories = Category.order(:name).all
  end

end
