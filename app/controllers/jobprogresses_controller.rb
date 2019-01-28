class JobprogressesController < ApplicationController
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
  
  before_action :set_project
  before_action :set_blog
  before_action :set_job_progress, only: [:update, :edit, :destroy]

  def index
  end

  def new
    @readonly = false
    @create = true
    @job_progress = @blog.job_progress.new
    @job = Job.find(params[:job_id])
    @concept = @job.concept
    render :new
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
      render action: :new
    end
  end

  def edit
    @readonly = false
    @create = false
    @concept = @job_progress.concept
  end

  def update
    if @job_progress.update_attributes(job_prog_params)
      flash[:success] = ' Trabajo modificado correctamente'
      redirect_to project_blog_url(project_id: @project, id: @blog)
    else
      flash[:error] = ' Error al modificar el trabajo'
      render :edit
    end
  end

  def destroy
    @job_progress.destroy
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
end
