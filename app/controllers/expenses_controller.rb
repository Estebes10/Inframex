class ExpensesController < ApplicationController

  before_action :set_expense, only: [:edit, :update, :destroy]
  before_action :set_categories_and_subcategories, only: [:new, :edit]

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
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
    params.require(:expense).permit!
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_categories_and_subcategories
    @categories = Category.all
    @subcategories = Subcategory.all
  end
end