class IncomesController < ApplicationController

  #RBAC show
  before_action only: [:index, :show] do
    has_privilege_controller(current_user, 'income_1')
  end

  #RBAC create
  before_action only: [:new, :create] do
    has_privilege_controller(current_user, 'income_2')
  end

  #RBAC edit
  before_action only: [:edit, :update] do
    has_privilege_controller(current_user, 'income_3')
  end

  #RBAC destroy
  before_action only: [:destroy, :destroy_ajax] do
    has_privilege_controller(current_user, 'income_4')
  end

  # Check if user belongs to project (also check if project exists)
  before_action do
    belongs_to_project_controller(current_user, params[:project_id])
  end

  before_action :set_project
  before_action :set_income, only: [:show, :edit, :update, :destroy, :destroy_ajax]
  before_action :get_payment_method, only: [:show, :edit]

  def index
    @tabs = "incomes"
    @incomes = @project.incomes.all
  end

  def show
    @read_only = true
    @mode_edit = false
    @required_str = ""
  end

  def new
    @income = @project.incomes.new
    @income.date = Time.now
    @mode_edit = false
    @read_only = false
    @required_str = "* "
  end

  def create
    @income = @project.incomes.new(incomes_params)

    if @income.save
      flash[:success] = ' Éxito al crear ingreso'
      redirect_to project_income_path(project_id: @project, id: @income)
    else
      flash.now[:error] = ' Error al crear ingreso'
      render action: 'new'
    end
  end

  def edit
    @mode_edit = true
    @read_only = false
    @required_str = "* "
  end

  def update
    if @income.update_attributes(incomes_params)
      flash[:success] = 'Ingreso modificado correctamente'
      redirect_to project_income_path(project_id: @project.id, id: @income.id)
    else
      flash.now[:error] = ' Error al modificar ingreso'
      render :edit
    end
  end

  def destroy_ajax
    @income.destroy
  end

  def destroy
    if @income.destroy
      flash[:success] = ' Se ha eliminado ingreso correctamente'
      redirect_to project_incomes_path(@project)
    else
      flash.now[:error] = ' No se ha podido eliminar el concepto'
      render :show
    end
  end

  private

  def incomes_params
    params.require(:income).permit(
        :name,
        :quantity,
        :iva,
        :total,
        :payment_method,
        :person,
        :date
    )
  end

  def set_income
    @income = @project.incomes.find_by!(id: params[:id]) if @project
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def get_payment_method
    @income_payment = @income.payment_method
  end

end
