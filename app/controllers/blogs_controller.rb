class BlogsController < ApplicationController
  #RBAC show
  before_action only: [:index, :show] do
    has_privilege_controller(current_user, 'blog_1')
  end

  #RBAC create
  before_action only: [:new, :create] do
    has_privilege_controller(current_user, 'blog_2')
  end

  #RBAC edit
  before_action only: [:edit, :update] do
    has_privilege_controller(current_user, 'blog_3')
  end

  #RBAC destroy
  before_action only: [:destroy, :destroy_ajax] do
    has_privilege_controller(current_user, 'blog_4')
  end

  #RBAC activate
  before_action only: [:activate] do
    has_privilege_controller(current_user, 'blog_5')
  end
  
  before_action :validate_user
  before_action :set_project
  before_action :set_blog, only: [:edit, :update, :show, :destroy, :destroy_ajax, :activate]

  def index
    @blogs = @project.blogs.order(:date)
  end

  def show
    @readonly = true
    @create = false
    @required_str = ""
    @concepts = @project.concepts.order(:code)
    @expenses = @blog.expenses.order(:name).all
  end

  def new
    @readonly = false
    @create = true
    @required_str = "* "
    @blog = @project.blogs.new
    @blog.date = Time.now
    @blog.status = false
  end

  def create
    @blog = @project.blogs.new(blog_params)
    if @blog.save
      flash[:success] = ' Éxito al crear la bitácora'
      redirect_to project_blog_path(project_id: @project, id: @blog)
    else
      flash.now[:danger] = ' Error al crear la bitácora'
      @readonly = false
      @create = true
      @required_str = "* "
      render action: :new
    end
  end

  def edit
    @readonly = false
    @create = false
    @required_str = "* "
  end

  def update
    if @blog.update_attributes(blog_params)
      flash[:success] = ' Bitácora modificada correctamente'
      redirect_to project_blog_path(project_id: @project, id: @blog)
    else
      flash[:error] = ' Error al modificar la bitácora'
      @readonly = false
      @create = false
      @required_str = "* "
      render :edit
    end
  end

  def destroy_ajax
    if @blog.jobs.count > 0
      # remove all jobs
      @blog.jobs.destroy_all
      # remove all expenses
      @blog.expenses.destroy_all
    end
    @blog.destroy
  end

  def destroy
    if @blog.jobs.count > 0
      # remove all jobs
      @blog.jobs.destroy_all
      # remove all expenses
      @blog.expenses.destroy_all
    end
    if @blog.destroy
      flash[:success] = ' Se ha eliminado la bitácora correctamente'
      redirect_to project_path(@project , :anchor => "nav-blogs")
    else
      flash.now[:error] = ' No se ha podido eliminar la bitácora'
      render :show
    end
  end

  def activate
    @blog.update_attribute(:status, params[:data])
  end

  private

  def blog_params
    params.require(:blog).permit(:name, :description, :date, :comments, :status)
  end

  def set_blog
    @blog = @project.blogs.find_by!(id: params[:id]) if @project
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
