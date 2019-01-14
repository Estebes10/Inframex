class SubcategoriesController < ApplicationController

  before_action :set_subcategory, only: [:edit, :update, :destroy_ajax]

  #RBAC index
  before_action only: [:index] do
    has_privilege_controller(current_user, 'category_4')
  end

  #RBAC create
  before_action only: [:create, :new] do
    has_privilege_controller(current_user, 'subcategory_1')
  end

  #RBAC edit
  before_action only: [:edit, :update] do
    has_privilege_controller(current_user, 'subcategory_2')
  end

  #RBAC destroy
  before_action only: [:destroy_ajax] do
    has_privilege_controller(current_user, 'subcategory_3')
  end

  def new
  end

  def create
    @subcategory = Subcategory.new(subcategory_param)
    if @subcategory.save
      flash[:success] = ' Éxito al crear la subcategoría. '
    else
      flash[:danger] = ' Error al crear la subcategoría. '
      set_flash_errors(@subcategory)
    end
    redirect_to categories_path
  end

  def edit
  end

  def update
    if @subcategory.update_attributes(subcategory_param)
      flash[:success] = ' Subcategoría modificada correctamente. '
    else
      flash[:danger] = ' Error al modificar subcategoría. '
      set_flash_errors(@subcategory)
    end
    redirect_to categories_path
  end

  def destroy_ajax
    if @subcategory.expenses.count > 0
      #remove all expenses
      @subcategory.expenses.destroy_all
    end
    @subcategory.destroy
  end

  private

  def subcategory_param
    params.require(:subcategory).permit(
        :name
    )
  end

  def set_subcategory
    @subcategory = Subcategory.find(params[:id])
  end

  def set_flash_errors(object)
    if object.errors.any?
      object.errors.full_messages.each do |msg|
        flash[:danger] += (msg + ". ")
      end
    end
  end
end
