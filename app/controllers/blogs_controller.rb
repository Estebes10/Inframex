class BlogsController < ApplicationController
  def index
    @blogs = Blog.order(:blog_date)
  end
end
