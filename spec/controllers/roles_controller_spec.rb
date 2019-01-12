require 'rails_helper'

RSpec.describe RolesController, type: :controller do

  describe 'GET index' do

    context 'when user has permissions' do
      it "assigns @roles" do
        roles = Role.all
        get :index
        expect(assigns(:roles)).to eq(roles)
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

    context 'when user has permissions' do

      context 'and record exists' do

        before(:each) do
          @role_example = FactoryBot.create(:role)
        end

        before(:each) do
          get(
            :show,
            params: { id: @role_example.id }
          )
        end

        it 'assigns @role' do
          expect(assigns(:role)).to eq(@role_example)
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
        #it { should respond_with_status(:not_found) }
      end
    end

    context 'when user has not permissions' do
      it 'must to redirect to another pages'
      it 'must to display unauthorized '
    end
  end

  describe 'GET new' do

    context 'when user has permissions' do
      it "assigns @role" do
      get(:new, xhr: true)
      expect(assigns(:role)).to be_a_new(Role)
    end

      it { should route(:get, '/roles/new').to(action: :new) }
    end

    context 'when user has not permissions' do
      it 'must render to another page'
    end
  end

  describe 'POST create' do

    context 'with valid attributes' do

      let(:valid_attributes) do
        {
          role: {
            name: Faker::Lorem.characters(30)
          }
        }
      end

      before(:each) do
        post(
          :create,
          params: valid_attributes,
          :format => "js",
          xhr: true
        )
      end

      it 'creates a new record' do
        expect(assigns(:role)).to be_persisted
      end

      it 'saves an instance of role and assigns to role variable' do
        expect(assigns(:role)).to be_a(Role)
      end

      it 'saves the given values' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:role).name).to eq(valid_attributes[:role][:name])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(200)
      end

      it 'redirects to index view' do
        expect(response).to redirect_to(roles_url)
      end

      it 'must display a success message' do
        expect(flash[:success]).to match(/ Rol creado.*/)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid attributes' do

      let(:not_valid_attributes) do
        {
          role: {
            name: nil
          }
        }
      end

      before(:each) do
        post(
          :create,
          params: not_valid_attributes
        )
      end

      it 'does not save an instance of role' do
        expect(response).not_to be_a_new(Role)
      end

      it 'renders new template' do
        expect(response).to redirect_to(roles_url)
      end

      it 'must display an error message' do
        expect(flash[:danger]).to be_present
      end
    end
  end

  describe 'GET edit' do

    context 'when user has permissions' do

      context 'and record exists' do

        before(:each) do
          @role_example = FactoryBot.create(:role)
        end

        before(:each) do
          get(
            :edit,
            params: { id: @role_example },
            format: :js,
            xhr: true
          )
        end

        it 'assigns @role' do
          expect(assigns(:role)).to eq(@role_example)
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
        #it { should respond_with_status(:not_found) }
      end
    end

    context 'when user has not permissions' do
      it 'must to redirect to another pages'
      it 'must to display unauthorized '
    end
  end

  describe 'PATCH update' do

    context 'with valid attributes' do

      before(:each) do
        @role_example_update = FactoryBot.create(:role)
      end

      let(:valid_attributes) do
        {
            name: Faker::Lorem.characters(30)
        }
      end

      before(:each) do
        put(
          :update,
          params: {:id => @role_example_update.to_param, :role => valid_attributes}
        )
      end

      it 'creates a new record' do
        expect(assigns(:role)).to be_persisted
      end

      it 'saves an instance of role and assigns to role variable' do
        expect(assigns(:role)).to be_a(Role)
      end

      it 'update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:role).name).to eq(valid_attributes[:name])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to user view' do
        expect(response).to redirect_to(roles_url)
      end

      it 'must display a success message' do
        expect(flash[:success]).to match(/ Nombre de Rol actualizado*/)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid attributes' do

      before(:each) do
        @role_example_update = FactoryBot.create(:role, name: 'update test')
      end

      # send string to blog date
      let(:not_valid_attributes) do
        {
            name: nil
        }
      end

      before(:each) do
        put(
          :update,
          params: {:id => @role_example_update.to_param, :role => not_valid_attributes}
        )
      end

      it 'does not update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(@role_example_update.name).not_to eq(not_valid_attributes[:name])
      end

      it 'does not save an instance of user' do
        expect(response).not_to be_a_new(Role)
      end
    end
  end

  describe "DELETE destroy" do

    before(:each) do
      @role_example_delete = FactoryBot.create(:role, name: 'delete test')
    end

    context 'when user has permissions' do

      it "destroys the requested user" do
        expect do
          delete :destroy, params: {:id => @role_example_delete.to_param}
        end.to change(Role, :count).by(-1)
      end

      it "must not redirect to the users index" do
        delete :destroy, params: {:id => @role_example_delete.to_param}
        expect(response).not_to redirect_to(roles_url)
      end

      it 'must not display a success message' do
        delete :destroy, params: {:id => @role_example_delete.to_param}
        expect(flash[:success]).not_to be_present
      end
    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end
end
