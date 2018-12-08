class BlogsController < ApplicationController
  def index
    @blogs = Blog.order(:blog_date)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to action: 'index'
    else
      render :action => :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:name, :description, :blog_date)
  end

end
