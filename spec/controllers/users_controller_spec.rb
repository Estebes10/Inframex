require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do

    context 'when user has permissions' do
      it "assigns @users" do
        users = User.all
        get :index
        expect(assigns(:users)).to eq(users)
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
          @user_example = FactoryBot.create(:user)
        end

        before(:each) do
          get(
            :show,
            params: { id: @user_example.id }
          )
        end

        it 'assigns @user' do
          expect(assigns(:user)).to eq(@user_example)
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
      it "renders the new template" do
        get :new
        expect(response).to render_template(:new)
      end

      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it { should route(:get, '/users/new').to(action: :new) }
    end

    context 'when user has not permissions' do
      it 'must render to another page'
    end
  end

  describe 'POST create' do

    context 'with valid attributes' do

      let(:valid_attributes) do
        {
          user: {
            name:     'Lionel',
            lastName: 'Messi',
            password: 'contrasena',
            email:    'messi10@example.com',
            birthday: Date.today - 30.years,
            phone:    '4428428989'
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
        expect(assigns(:user)).to be_persisted
      end

      it 'saves an instance of user and assigns to user variable' do
        expect(assigns(:user)).to be_a(User)
      end

      it 'saves the given values' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:user).name).to eq(valid_attributes[:user][:name])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to index view' do
        @u = assigns(:user)
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        expect(response).to redirect_to(user_url(@u))
      end

      it 'must display a success message' do
        expect(flash[:success]).to match(/ Éxito al crear el usuario*/)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid attributes' do

      let(:not_valid_attributes) do
        {
          user: {
            name:        nil,
            lastName: 'Ejemplo de bitácora de prueba',
            blog_date:   Date.today,
          }
        }
      end

      before(:each) do
        post(
          :create,
          params: not_valid_attributes
        )
      end

      it 'does not save an instance of user' do
        expect(response).not_to be_a_new(User)
      end

      it 'renders new template' do
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        expect(response).to render_template("new")
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
          @user_example = FactoryBot.create(:user)
        end

        before(:each) do
          get(
            :edit,
            params: { id: @user_example }
          )
        end

        it 'assigns @user' do
          expect(assigns(:user)).to eq(@user_example)
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
        @user_example_update = FactoryBot.create(:user)
      end

      let(:valid_attributes) do
        {
            name:      Faker::Name.first_name,
            lastName:   Faker::Name.last_name,
            birthday:   Date.today - 40.years,
        }
      end

      before(:each) do
        put(
          :update,
          params: {:id => @user_example_update.to_param, :user => valid_attributes}
        )
      end

      it 'creates a new record' do
        expect(assigns(:user)).to be_persisted
      end

      it 'saves an instance of user and assigns to user variable' do
        expect(assigns(:user)).to be_a(User)
      end

      it 'update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:user).name).to eq(valid_attributes[:name])
        expect(assigns(:user).lastName).to eq(valid_attributes[:lastName])
        expect(assigns(:user).birthday).to eq(valid_attributes[:birthday])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to user view' do
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        expect(response).to redirect_to(user_url(@user_example_update))
      end

      it 'must display a success message' do
        expect(flash[:success]).to match(/ Usuario modificado correctamente*/)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid attributes' do

      before(:each) do
        @user_example_update = FactoryBot.create(:user, name: 'update test')
      end

      # send string to blog date
      let(:not_valid_attributes) do
        {
            name:     'No debería cambiar este nombre por la fecha no valida',
            lastName: 'Ejemplo de bitácora de prueba',
            birthday: 'Fecha no válida',
        }
      end

      before(:each) do
        put(
          :update,
          params: {:id => @user_example_update.to_param, :user => not_valid_attributes}
        )
      end

      it 'does not update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(@user_example_update.name).not_to eq(not_valid_attributes[:name])
        expect(@user_example_update.lastName).not_to eq(not_valid_attributes[:lastName])
        expect(@user_example_update.birthday).not_to eq(not_valid_attributes[:birthday])
      end

      it 'does not save an instance of user' do
        expect(response).not_to be_a_new(User)
      end

      #it 'renders new template' do
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        #expect(response).to render_template("edit")
      #end

      #it 'must display an error message' do
      #  expect(flash[:error]).to be_present
      #  expect(flash[:error]).to match(/ Error al modificar usuario*/)
      #end
    end
  end

  describe "DELETE destroy" do

    before(:each) do
      @user_example_delete = FactoryBot.create(:user, name: 'delete test')
    end

    context 'when user has permissions' do

      it "destroys the requested user" do
        expect do
          delete :destroy, params: {:id => @user_example_delete.to_param}
        end.to change(User, :count).by(-1)
      end

      it "must not redirect to the users index" do
        delete :destroy, params: {:id => @user_example_delete.to_param}
        expect(response).not_to redirect_to(users_url)
      end

      it 'must not display a success message' do
        delete :destroy, params: {:id => @user_example_delete.to_param}
        expect(flash[:success]).not_to be_present
      end
    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end
end
