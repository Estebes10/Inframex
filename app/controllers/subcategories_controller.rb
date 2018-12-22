class SubcategoriesController < ApplicationController

  before_action :set_subcategory, only: [:edit, :update, :destroy_ajax]

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_param)

    if @subcategory.save
      flash[:success] = ' Éxito al crear la subcategoría'
      redirect_to categories_path
    else
      flash[:error] = ' Error al crear la subcategoría'
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @subcategory.update_attributes(subcategory_param)
      flash[:success] = ' Subcategoría modificado correctamente'
      redirect_to categories_path
    else
      flash[:error] = ' Error al modificar subcategoría'
      render :edit
    end
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
end
