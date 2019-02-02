class JobsController < ApplicationController

  #RBAC index
  before_action only: [:index] do
    has_privilege_controller(current_user, 'job_4')
  end

  #RBAC create
  before_action only: [:create, :new] do
    has_privilege_controller(current_user, 'job_1')
  end

  #RBAC edit
  before_action only: [:edit, :update] do
    has_privilege_controller(current_user, 'job_2')
  end

  #RBAC destroy
  before_action only: [:destroy] do
    has_privilege_controller(current_user, 'job_3')
  end
  
  before_action :set_project
  before_action :set_blog
  before_action :set_job, only: [:update, :edit, :destroy]

  def index
  end

  def new
    @readonly = false
    @create = true
    @job = @blog.jobs.new
    @concept = Concept.find(params[:concept_id])
    render :new
  end

  def create
    @job = @blog.jobs.new(job_params)
    if @job.save
      flash[:success] = ' Éxito al crear el trabajo'
      redirect_to project_blog_url(project_id: @project, id: @blog)
    else
      flash.now[:danger] = ' Error al crear el trabajo'
      @readonly = false
      @create = true
      @concept = Concept.find(params[:concept_id])
      render action: :new
    end
  end

  def edit
    @readonly = false
    @create = false
    @concept = @job.concept
  end

  def update
    if @job.update_attributes(job_params)
      flash[:success] = ' Trabajo modificado correctamente'
      redirect_to project_blog_url(project_id: @project, id: @blog)
    else
      flash[:error] = ' Error al modificar el trabajo'
      render :edit
    end
  end

  def destroy
    @job.destroy
  end

  private

  def job_params
    params.require(:job).permit(:name,
                                :quantity,
                                :concept_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_blog
    @blog = @project.blogs.find_by!(id: params[:blog_id]) if @project
  end

  # find current job
  def set_job
    @job = @blog.jobs.find_by!(id: params[:id]) if @blog
  end

end
