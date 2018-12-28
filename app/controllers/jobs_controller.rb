class JobsController < ApplicationController

  before_action :set_project
  before_action :set_blog
  before_action :set_job, only: [:show, :update, :edit, :destroy]

  def index
    @jobs = @blog.jobs
  end

  def new
    @readonly = false
    @create = true
    @job = @blog.jobs.new
  end

  def show
    @readonly = true
    @create = false
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
      # @roles = Role.all
      render action: :new
    end
  end

  def edit
    @readonly = false
    @create = false
  end

  def update
    if @job.update_attributes(job_params)
      flash[:success] = ' Trabajo modificada correctamente'
      redirect_to cc
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
    params.require(:job).permit(:name)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_blog
    @blog = @project.blogs.find_by!(id: params[:blog_id]) if @project
    #@blog = Blog.find(params[:blog_id])
  end

  # find current job
  def set_job
    @job = @blog.jobs.find_by!(id: params[:id]) if @blog
  end

end
