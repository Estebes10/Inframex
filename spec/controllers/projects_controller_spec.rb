require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'GET index' do

    before(:each) do
      sign_in()
    end

    context 'when user has permissions' do

      it "assigns @projects" do
        projects = Project.order(:id)
        get :index
        expect(assigns(:projects)).to eq(projects)
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template(:index)
      end

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user has not permissions' do
      it 'must redirects to another page'
    end
  end

  describe 'GET show' do

    before(:each) do
      sign_in
    end

    context 'when user has permissions' do

      context 'and record exists' do

        before(:each) do
          @project_example = FactoryBot.create(:project)
        end

        before(:each) do
          get(
            :show,
            params: { id: @project_example.id }
          )
        end

        it 'assigns @project' do
          expect(assigns(:project)).to eq(@project_example)
        end

        it 'renders the show template' do
          expect(response).to render_template(:show)
        end

        it 'return http found code' do
          expect(response).to have_http_status(:ok)
        end
      end

      context 'and record does not exist' do

        before(:each) do
          get(
            :show,
            params: { id: -124 }
          )
        end

        it 'should respond with not found code' do
          expect(response).to have_http_status(404)
        end

      end
    end

    context 'when user has not permissions' do
      it 'must to redirect to another pages'
      it 'must to display unauthorized '
    end
  end

  describe 'GET new' do

    before(:each) do
      sign_in
    end

    context 'when user has permissions' do
      it "renders the new template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it { should route(:get, '/projects/new').to(action: :new) }
    end

    context 'when user has not permissions' do
      it 'must render to another page'
    end
  end

  describe 'POST create' do

    before(:each) do
      sign_in
    end

    context 'with valid attributes' do

      let(:valid_attributes) do
        {
          project: {
            name:    Faker::App.name,
            code:    Faker::Lorem.characters(30),
            address: Faker::Address.full_address,
            client:  Faker::Company.name,
            status:  false
          }
        }
      end

      before(:each) do
        post(
          :create,
          params: valid_attributes
        )
      end

      it 'creates a new record' do
        expect(assigns(:project)).to be_persisted
      end

      it 'saves an instance of project and assigns to project variable' do
        expect(assigns(:project)).to be_a(Project)
      end

      it 'saves the given values' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:project).name).to eq(valid_attributes[:project][:name])
        expect(assigns(:project).code).to eq(valid_attributes[:project][:code])
        expect(assigns(:project).status).to eq(valid_attributes[:project][:status])
        expect(assigns(:project).address).to eq(valid_attributes[:project][:address])
        expect(assigns(:project).client).to eq(valid_attributes[:project][:client])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to index view' do
        @u = assigns(:project)
        expect(response).to redirect_to(project_url(@u))
      end

      it 'must display a success message' do
        expect(flash[:success]).to match(/ Éxito al crear el proyecto*/)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid attributes' do

      let(:not_valid_attributes) do
        {
          project: {
            name:       nil,
            code:      'Ejemplo de bitácora de prueba',
            address:   Date.today,
          }
        }
      end

      before(:each) do
        post(
          :create,
          params: not_valid_attributes
        )
      end

      it 'does not save an instance of project' do
        expect(response).not_to be_a_new(Project)
      end

      it 'renders new template' do
        expect(response).to render_template("new")
      end

      it 'must display an error message' do
        expect(flash[:danger]).to be_present
      end
    end
  end

  describe 'GET edit' do

    before(:each) do
      sign_in
    end

    context 'when user has permissions' do

      context 'and record exists' do

        before(:each) do
          @project_example = FactoryBot.create(:project)
        end

        before(:each) do
          get(
            :edit,
            params: { id: @project_example }
          )
        end

        it 'assigns @project' do
          expect(assigns(:project)).to eq(@project_example)
        end

        it 'renders the show template' do
          expect(response).to render_template(:edit)
        end

        it 'return http found code' do
          expect(response).to have_http_status(:ok)
        end
      end

      context 'and record does not exist' do

        before(:each) do
          get(
            :show,
            params: { id: -124 }
          )
        end

        it 'should respond with not found code' do
          expect(response).to have_http_status(404)
        end
      end
    end

    context 'when user has not permissions' do
      it 'must to redirect to another pages'
      it 'must to display unauthorized '
    end
  end

  describe 'PATCH update' do

    before(:each) do
      sign_in
    end

    context 'with valid attributes' do

      before(:each) do
        @project_example_update = FactoryBot.create(:project)
      end

      let(:valid_attributes) do
        {
            name:      Faker::App.name,
            address:   Faker::Address.full_address,
        }
      end

      before(:each) do
        put(
          :update,
          params: {:id => @project_example_update.to_param, :project => valid_attributes}
        )
      end

      it 'creates a new record' do
        expect(assigns(:project)).to be_persisted
      end

      it 'saves an instance of project and assigns to project variable' do
        expect(assigns(:project)).to be_a(Project)
      end

      it 'update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:project).name).to eq(valid_attributes[:name])
        expect(assigns(:project).address).to eq(valid_attributes[:address])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to project view' do
        expect(response).to redirect_to(project_url(@project_example_update))
      end

      it 'must display a success message' do
        expect(flash[:success]).to match(/ Proyecto modificado correctamente*/)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid attributes' do

      before(:each) do
        @project_example_update = FactoryBot.create(:project, name: 'update test')
      end

      # send string to blog date
      let(:not_valid_attributes) do
        {
            name: 'No debería cambiar este nombre por el código no valido',
            code: nil,
        }
      end

      before(:each) do
        put(
          :update,
          params: {:id => @project_example_update.to_param, :project => not_valid_attributes}
        )
      end

      it 'does not update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(@project_example_update.name).not_to eq(not_valid_attributes[:name])
        expect(@project_example_update.code).not_to eq(not_valid_attributes[:code])
      end

      it 'does not save an instance of project' do
        expect(response).not_to be_a_new(Project)
      end

    end
  end

  describe "DELETE destroy" do

    before(:each) do
      sign_in
    end

    before(:each) do
      @project_example_delete = FactoryBot.create(:project, name: 'delete test')
    end

    context 'when user has permissions' do

      it "destroys the requested project" do
        expect do
          delete :destroy, params: {:id => @project_example_delete.to_param}
        end.to change(Project, :count).by(-1)
      end

      it "must not redirect to the projects index" do
        delete :destroy, params: {:id => @project_example_delete.to_param}
        expect(response).not_to redirect_to(projects_url)
      end

      it 'must not display a success message' do
        delete :destroy, params: {:id => @project_example_delete.to_param}
        expect(flash[:success]).not_to be_present
      end
    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end

end
