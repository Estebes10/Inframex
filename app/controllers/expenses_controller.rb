class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  def create
    @expense = Expense.new(expenses_params)
    totalval = @expense.quantity * @expense.unit_price
    @expense.total = totalval

    if @subcategory.save
      #flash[:success] = ' Éxito al crear gasto'
      redirect_to action: 'index'
    else
      #flash[:error] = ' Error al crear gasto'
      render action: 'new'
    end
  end
  def expenses_params
    params.require(:expenses).permit(:category_id, :subcategory_id, :name, :date, :quantity, :unity, :unit_price, :total, :status)
  end
end