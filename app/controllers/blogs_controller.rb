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

  #RBAC delete_image_attachment
  before_action only: [:delete_image_attachment] do
    has_privilege_controller(current_user, 'file_4')
  end

  #RBAC update image info
  before_action only: [:edit_image_info, :update_image_info] do
    has_privilege_controller(current_user, 'file_3')
  end

  before_action :validate_user
  before_action :set_project
  before_action :set_blog, only: [:edit, :update, :show, :destroy, :destroy_ajax, :activate, :delete_image_attachment, :edit_image_info, :update_image_info]

  def index
    @blogs = @project.blogs.order(:date)
  end

  def show
    @readonly = true
    @create = false
    @required_str = ""
    @concepts = @project.concepts.order(:code)
    @has_concepts_jobs = @concepts.joins(:jobs).any?
    @column_size = "col-md-12 mT-15"

    #Check privileges to retrieve jobs and expenses
    if has_privilege(current_user, 'job_prog_7')
      @job_progress = @blog.job_progress.where(status: true).all
    else
      @job_progress = @blog.job_progress.all
    end

    if has_privilege(current_user, 'expenses_9')
      @expenses = @blog.expenses.where(status: true).order(:name).all
    else
      @expenses = @blog.expenses.order(:name).all
    end
  end

  def new
    @readonly = false
    @create = true
    @required_str = "* "
    @blog = @project.blogs.new
    @blog.date = Time.now
    @blog.status = false
    @column_size = "col-md-6 mT-15"
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
    @column_size = "col-md-6 mT-15"
  end

  def update
    if @blog.update_attributes(blog_params)
      flash[:success] = ' Bitácora modificada correctamente'
      redirect_to project_blog_path(project_id: @project, id: @blog)
    else
      flash[:danger] = ' Error al modificar la bitácora'
      @readonly = false
      @create = false
      @required_str = "* "
      render :edit
    end
  end

  def destroy_ajax
    @blog.destroy
  end

  def destroy
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

  def delete_image_attachment
    @image = @blog.files.find(params[:attachment_id]).purge
  end

  def edit_image_info
    @image = @blog.files.find(params[:attachment_id])
  end

  def update_image_info
    @image = @blog.files.find(params[:attachment_id])
    if @image.blob.update_attributes!(file_params)
      @image.save
      flash[:success] = ' Archivo modificado correctamente'
      redirect_to project_blog_path(project_id: @project, id: @blog)
    else
      flash[:danger] = ' Error al modificar el archivo'
      render :edit
    end
  end

  private

  def file_params
    params.require(:attachment).permit(:filename, :description)
  end

  def blog_params
    params.require(:blog).permit(:name, :description, :date, :comments, :status, files: [])
  end

  def set_blog
    @blog = @project.blogs.find_by!(id: params[:id]) if @project
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
