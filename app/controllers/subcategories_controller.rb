class SubcategoriesController < ApplicationController

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_param)

    if @subcategory.save
      #flash[:success] = ' Éxito al crear la subcategoría'
      redirect_to category_index_path
    else
      #flash[:error] = ' Error al crear la subcategoría'
      render action: 'new'
    end
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def update
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.update_attributes(subcategory_param)
      #flash[:success] = ' Subategoría modificado correctamente'
      redirect_to category_index_path
    else
      #flash[:error] = ' Error al modificar subcategoría'
      render :edit
    end
  end

  def destroy
    @subcategory = Subcategory.find(params[:id]).destroy
    #flash[:success] = ' Se ha eliminado la subcategoría correctamente'
    redirect_to category_index_path
  end

  def subcategory_param
    params.require(:subcategory).permit(
        :name
    )
  end
end
