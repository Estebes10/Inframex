class ConceptsController < ApplicationController

  #RBAC show
  before_action only: [:index, :show] do
    has_privilege_controller(current_user, 'concept_1')
  end

  #RBAC create
  before_action only: [:new, :create] do
    has_privilege_controller(current_user, 'concept_2')
  end

  #RBAC edit
  before_action only: [:edit, :update] do
    has_privilege_controller(current_user, 'concept_3')
  end

  #RBAC destroy
  before_action only: [:destroy, :destroy_ajax] do
    has_privilege_controller(current_user, 'concept_4')
  end
  
  before_action :set_project
  before_action :set_concept, only: [:show, :edit, :update, :destroy, :destroy_ajax]
  before_action :set_categories, only: [:show, :new, :index, :edit]

  def index
  end

  def show
    @read_only = true
    @mode_edit = false
    @required_str = ""
    if has_privilege(current_user, 'expenses_9')
      @expenses = @concept.expenses.where(status: true).order(:name).all
    else
      @expenses = @concept.expenses.order(:name).all
    end
  end

  def new
    @concept = @project.concepts.new
    @mode_edit = false
    @read_only = false
    @required_str = "* "
  end

  def create
    @concept = @project.concepts.new(concepts_params)

    if @concept.save
      flash[:success] = ' Éxito al crear concepto'
      redirect_to project_path(@project , :anchor => "nav-concepts")
    else
      flash.now[:error] = ' Error al crear concepto'
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
      redirect_to project_path(@project , :anchor => "nav-concepts")
    else
      flash.now[:error] = ' Error al modificar concepto'
      render :edit
    end
  end

  def destroy_ajax
    @concept.destroy
  end

  def destroy
    if @concept.destroy
      flash[:success] = ' Se ha eliminado concepto correctamente'
      redirect_to project_path(@project , :anchor => "nav-concepts")
    else
      flash.now[:error] = ' No se ha podido eliminar el concepto'
      render :show
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
        :total,
        :weight
    )
  end

  def set_concept
    @concept = @project.concepts.find_by!(id: params[:id]) if @project
    @category_id = @concept.category_id
  end

  def set_categories
    @categories = Category.order(:name).all
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
