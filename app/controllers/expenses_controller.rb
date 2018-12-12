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

    if @expense.save
      #flash[:success] = ' Éxito al crear gasto'
      redirect_to action: 'index'
    else
      #flash[:error] = ' Error al crear gasto'
      render action: 'new'
    end
  end

  def edit
    @expense = Expense.find(params[:id])
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  def update
    @expense = Expense.find(params[:id])
    totalval = @expense.quantity * @expense.unit_price
    @expense.total = totalval
    if @expense.update_attributes(expenses_params)
      #flash[:success] = ' Gasto modificado correctamente'
      redirect_to action: 'index'
    else
      #flash[:error] = ' Error al modificar gasto'
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id]).destroy
    #flash[:success] = ' Se ha eliminado gasto correctamente'
    redirect_to action: 'index'
  end

  def expenses_params
    params.require(:expense).permit(:category_id, :subcategory_id, :name, :date, :quantity, :unity, :unit_price, :total, :status)
  end
end