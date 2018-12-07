class SubcategoriesController < ApplicationController
  def index
    @subcategories = Subcategory.all.order(:name)
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(:name)

    if @subcategory.save
      #flash[:success] = ' Éxito al crear la subcategoría'
      redirect_to action: 'index'
    else
      #flash[:error] = ' Error al crear la subcategoría'
      render action: 'new'
    end
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def update
    if @subcategory.update_attributes(:name)
      #flash[:success] = ' Subategoría modificado correctamente'
      redirect_to action: 'index'
    else
      #flash[:error] = ' Error al modificar subcategoría'
      render :edit
    end
  end

  def destroy
    @subcategory = Subcategory.find(params[:id]).destroy
    #flash[:success] = ' Se ha eliminado la subcategoría correctamente'
    redirect_to action: 'index'
  end
end
