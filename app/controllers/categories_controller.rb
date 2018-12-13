class CategoriesController < ApplicationController
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
      #flash[:success] = ' Éxito al crear la categoría'
      redirect_to action: 'index'
    else
      #flash[:error] = ' Error al crear la categoría'
      render action: 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_param)
      #flash[:success] = ' Categoría modificado correctamente'
      redirect_to action: 'index'
    else
      #flash[:error] = ' Error al modificar categoría'
      render action: 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    #flash[:success] = ' Se ha eliminado la categoría correctamente'
    redirect_to action: 'index'
  end

  def category_param
    params.require(:category).permit(
        :name
    )
  end
end
