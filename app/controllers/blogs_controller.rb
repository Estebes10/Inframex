class BlogsController < ApplicationController

  def index
    @blogs = Blog.order(:blog_date)
  end

  def show
    @readonly = true
    @create = false
    @blog = Blog.find(params[:id])
  end

  def new
    @readonly = false
    @create = true
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:success] = ' Éxito al crear la bitácora'
      redirect_to action: :index
    else
      flash.now[:danger] = ' Error al crear la bitácora'
      @readonly = false
      @create = true
      # @roles = Role.all
      render action: :new
    end
  end

  def edit
    @readonly = false
    @create = false
    @blog = Blog.find(params[:id])
  end

  def update
    # @roles = Role.all
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      flash[:success] = ' Bitácora modificada correctamente'
      redirect_to blog_url(@blog)
    else
      flash[:error] = ' Error al modificar la bitácora'
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:success] = ' Se ha eliminado la bitácora correctamente'
      redirect_to action: :index
    else
      flash[:error] = ' No se ha podido eliminar la bitácora'
      render :show
    end
  end

  def activate
    @blog = Blog.find(params[:id])
    if @blog.update_attribute(:status, params[:data])
      #flash[:success].now = ' Estatus modificado exitosamente'
    else
      #flash[:Error].now = ' Error al modificar el usuario'
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:name, :description, :blog_date)
  end

end
