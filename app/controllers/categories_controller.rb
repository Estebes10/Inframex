class CategoriesController < ApplicationController

  #RBAC index
  before_action only: [:index] do
    has_privilege_controller(current_user, 'category_4')
  end

  #RBAC create
  before_action only: [:create, :new] do
    has_privilege_controller(current_user, 'category_1')
  end

  #RBAC edit
  before_action only: [:edit, :update] do
    has_privilege_controller(current_user, 'category_2')
  end

  #RBAC destroy
  before_action only: [:destroy_ajax] do
    has_privilege_controller(current_user, 'category_3')
  end
  
  before_action :set_category, only: [:edit, :update, :destroy_ajax]

  def index
    @categories = Category.all.order(:name)
    @subcategories = Subcategory.all.order(:name)
    # new category and subcategory for modal partials
    @category = Category.new
    @subcategory = Subcategory.new
  end

  def new
  end

  def create
    @category = Category.new(category_param)
    if @category.save
      flash[:success] = ' Éxito al crear la categoría. '
    else
      flash[:danger] = ' Error al crear la categoría. '
      set_flash_errors(@category)
    end
    redirect_to action: 'index'
  end

  def edit
  end

  def update
    if @category.update_attributes(category_param)
      flash[:success] = ' Categoría modificada correctamente. '
    else
      flash[:danger] = ' Error al modificar categoría. '
      set_flash_errors(@category)
    end
    redirect_to action: 'index'
  end

  def destroy_ajax
    if @category.concepts.count > 0
      #remove all concepts
      @category.concepts.destroy_all
    end
    @category.destroy
  end

  private

  def category_param
    params.require(:category).permit(
        :name
    )
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_flash_errors(object)
    if object.errors.any?
      object.errors.full_messages.each do |msg|
        flash[:danger] += (msg + ". ")
      end
    end
  end
end
