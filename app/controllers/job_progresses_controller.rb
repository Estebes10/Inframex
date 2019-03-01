class JobProgressesController < ApplicationController
    #RBAC index
  before_action only: [:index] do
    has_privilege_controller(current_user, 'job_prog_4')
  end

  #RBAC create
  before_action only: [:create, :new] do
    has_privilege_controller(current_user, 'job_prog_1')
  end

  #RBAC edit
  before_action only: [:edit, :update] do
    has_privilege_controller(current_user, 'job_prog_2')
  end

  #RBAC destroy
  before_action only: [:destroy] do
    has_privilege_controller(current_user, 'job_prog_3')
  end
  
  before_action :set_project, except: [:activate]
  before_action :set_blog, except: [:activate]
  before_action :set_job_progress, only: [:update, :edit, :destroy]
  before_action :set_job_progress_ajax, only: [:activate]

  def index
  end

  def new
    @readonly = false
    @create = true
    @job_progress = @blog.job_progress.new
    @job = Job.find(params[:job_id])
    @job_progress.job_id = @job.id
    @concept = @job.concept
  end

  def create
    @job_progress = @blog.job_progress.new(job_prog_params)
    if @job_progress.save
      flash[:success] = ' Éxito al crear el trabajo'
      redirect_to project_blog_url(project_id: @project, id: @blog)
    else
      flash.now[:danger] = ' Error al crear el trabajo'
      @readonly = false
      @create = true
      @job = Job.find(params[:job_id])
      @concept = @job.concept
      render action: :new
    end
  end

  def edit
    @readonly = false
    @create = false
    @job = @job_progress.job
    @concept = @job.concept
  end

  def update
    if @job_progress.update_attributes(job_prog_params)
      flash[:success] = ' Trabajo modificado correctamente'
      redirect_to project_blog_url(project_id: @project, id: @blog)
    else
      flash[:danger] = ' Error al modificar el trabajo'
      render :edit
    end
  end

  def destroy
    @job_progress.destroy
  end

  def activate
    @job_progress.update_attribute(:status, params[:data])
  end

  private

  def job_prog_params
    params.require(:job_progress).permit(:quantity,
                                :blog_id,
                                :job_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_blog
    @blog = @project.blogs.find_by!(id: params[:blog_id]) if @project
  end

  # find current job
  def set_job_progress
    @job_progress = @blog.job_progress.find_by!(id: params[:id]) if @blog
  end
  
  # find current job for ajax methods
  def set_job_progress_ajax
    @job_progress = JobProgress.find(params[:id])
  end
end
