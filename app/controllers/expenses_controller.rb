class ExpensesController < ApplicationController

  before_action :select_objects, only: [:show, :edit]
  before_action :set_expense, only: [:show, :edit, :update, :destroy, :destroy_ajax]
  before_action :set_categories_subcategories_and_concepts, only: [:show, :new, :edit]


  def index
    @expenses = Expense.all
  end

  def show
    @read_only = true
    @mode_edit = false
    @required_str = ""
  end

  def new
    @expense = Expense.new
    @mode_edit = false
    @read_only = false
    @required_str = "* "
  end

  def create
    @expense = Expense.new(expenses_params)
    totalval = @expense.quantity * @expense.unit_price
    @expense.total = totalval

    if @expense.save
      flash[:success] = ' Éxito al crear gasto'
      redirect_to action: 'index'
    else
      flash[:error] = ' Error al crear gasto'
      render action: 'new'
    end
  end

  def edit
    @mode_edit = true
    @read_only = false
    @required_str = "* "
  end

  def update
    totalval = @expense.quantity * @expense.unit_price
    @expense.total = totalval
    if @expense.update_attributes(expenses_params)
      flash[:success] = ' Gasto modificado correctamente'
      redirect_to action: 'index'
    else
      flash[:error] = ' Error al modificar gasto'
      render :edit
    end
  end

  def destroy_ajax
    @expense.destroy
  end

  def destroy
    if @expense.destroy
      flash[:success] = ' Se ha eliminado gasto correctamente'
      redirect_to action: 'index'
    else
      flash[:error] = ' No se ha podido eliminar el gasto'
      redirect_to action: 'index'
    end
  end

  private

  def expenses_params
    params.require(:expense).permit(
        :subcategory_id,
        :concept_id,
        :name,
        :date,
        :unity,
        :unit_price,
        :total,
        :status,
        :status_ticket,
        :quantity,
        :supplier_name
    )
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def select_objects
    @expense = Expense.find(params[:id])
    @concept_id = @expense.concept_id
    @subcategory_id = @expense.subcategory_id
    puts(@concept_id)
    puts(@subcategory_id)
  end

  def set_categories_subcategories_and_concepts
    @categories = Category.order(:name).all
    @subcategories = Subcategory.order(:name).all
    @concepts = Concept.order(:code).all
  end
end