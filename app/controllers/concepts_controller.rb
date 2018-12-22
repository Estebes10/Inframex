class ConceptsController < ApplicationController
  before_action :set_concept, only: [:show, :edit, :update, :destroy, :destroy_ajax]
  before_action :set_categories, only: [:show, :new, :index, :edit]

  def index
  end

  def show
    @read_only = true
    @mode_edit = false
    @required_str = ""
  end

  def new
    @concept = Concept.new
    @mode_edit = false
    @read_only = false
    @required_str = "* "
  end

  def create
    @concept = Concept.new(concepts_params)

    if @concept.save
      flash[:success] = ' Éxito al crear concepto'
      redirect_to @concept
    else
      flash[:error] = ' Error al crear concepto'
      render action: 'new'
    end
  end

  def edit
    @mode_edit = true
    @read_only = false
    @required_str = "* "
  end

  def update
    if @concept.update_attributes(concepts_params)
      flash[:success] = ' Concepto modificado correctamente'
      redirect_to action: 'index'
    else
      flash[:error] = ' Error al modificar concepto'
      render :edit
    end
  end

  def destroy_ajax
    if @concept.expenses.count > 0
      #remove all expenses
      @concept.expenses.destroy_all
    end
    @concept.destroy
  end

  def destroy
    if @concept.expenses.count > 0
      #remove all expenses
      @concept.expenses.destroy_all
    end
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
    @category_id = @concept.category_id
  end

  def set_categories
    @categories = Category.order(:name).all
  end

end