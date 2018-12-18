class ConceptsController < ApplicationController
  before_action :set_concept, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:new, :index, :edit]

  def index
  end

  def show
    @readonly = true
    @concept = Concept.find(params[:id])
  end

  def new
    @concept = Concept.new
    @mode_edit = false
    @read_only = false
  end

  def create
    @concept = Concept.new(concepts_params)
    totalval = @concept.quantity * @concept.unit_price
    @concept.total = totalval

    if @concept.save
      flash[:success] = ' Éxito al crear concepto'
      redirect_to action: 'index'
    else
      flash[:error] = ' Error al crear concepto'
      render action: 'new'
    end
  end

  def edit
    @mode_edit = true
    @read_only = false
  end

  def update
    totalval = @concept.quantity * @concept.unit_price
    @concept.total = totalval
    if @concept.update_attributes(concepts_params)
      flash[:success] = ' Concepto modificado correctamente'
      redirect_to action: 'index'
    else
      flash[:error] = ' Error al modificar concepto'
      render :edit
    end
  end

  def destroy
    if @concept.destroy
      flash[:success] = ' Se ha eliminado concepto correctamente'
      redirect_to action: 'index'
    else
      flash[:error] = ' No se ha podido eliminar el concepto'
      redirect_to action: 'index'
    end
  end

  private

  def concepts_params
    params.require(:concept).permit(
        :category_id,
        :code,
        :description,
        :quantity,
        :unity,
        :unit_price,
        :total
    )
  end

  def set_concept
    @concept = Concept.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

end
