class ExpensesController < ApplicationController

  before_action :set_project, except: [:destroy_ajax, :activate, :activate_ticket]
  before_action :set_blog, except: [:destroy_ajax, :activate, :activate_ticket]
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_expense_ajax, only: [:destroy_ajax, :activate, :activate_ticket]
  before_action :select_objects, only: [:show, :edit]
  before_action :set_categories_subcategories_and_concepts, only: [:show, :new, :edit]


  def index
    @expenses = @blog.expenses.all
  end

  def show
    @read_only = true
    @mode_edit = false
    @required_str = ""
  end

  def new
    @expense = @blog.expenses.new
    @mode_edit = false
    @read_only = false
    @required_str = "* "
  end

  def create
    @expense = @blog.expenses.new(expenses_params)
    if @expense.save
      flash[:success] = ' Éxito al crear gasto'
      redirect_to project_blog_url(project_id: @project, id: @blog)
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
    if @expense.update_attributes(expenses_params)
      flash[:success] = ' Gasto modificado correctamente'
      redirect_to project_blog_url(project_id: @project, id: @blog)
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
      redirect_to project_blog_url(project_id: @project, id: @blog)
    else
      flash[:error] = ' No se ha podido eliminar el gasto'
      redirect_to action: 'index'
    end
  end

  def activate
    @expense.update_attribute(:status, params[:data])
  end

  def activate_ticket
    @expense.update_attribute(:status_ticket, params[:data])
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

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_blog
    @blog = @project.blogs.find_by!(id: params[:blog_id]) if @project
  end

  def set_expense
    @expense = @blog.expenses.find_by!(id: params[:id]) if @blog
  end

  def set_expense_ajax
    @expense = Expense.find(params[:id])
  end

  def select_objects
    #@expense = @blog.expenses.find_by!(id: params[:id]) if @blog
    @concept_id = @expense.concept_id
    @subcategory_id = @expense.subcategory_id
  end

  def set_categories_subcategories_and_concepts
    @categories = Category.order(:name).all
    @subcategories = Subcategory.order(:name).all
    @concepts = @project.concepts.order(:code).all
  end
end