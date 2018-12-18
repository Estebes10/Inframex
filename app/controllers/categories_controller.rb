class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all.order(:name)
    @subcategories = Subcategory.all.order(:name)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)

    if @category.save
      flash[:success] = ' Éxito al crear la categoría'
      redirect_to action: 'index'
    else
      flash[:error] = ' Error al crear la categoría'
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_param)
      flash[:success] = ' Categoría modificado correctamente'
      redirect_to action: 'index'
    else
      flash[:error] = ' Error al modificar categoría'
      render action: 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = ' Se ha eliminado la categoría correctamente'
      redirect_to action: 'index'
    else
      flash[:error] = ' No se ha podido eliminar la categoría'
      redirect_to action: 'index'
    end
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
end
