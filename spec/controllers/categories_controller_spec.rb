require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe 'GET index' do

    context 'when user has permissions' do
      it "assigns @categories" do
        categories = Category.all.order(:name)
        get :index
        expect(assigns(:categories)).to eq(categories)
      end

      it "assigns @subcategories" do
        subcategories = Subcategory.all.order(:name)
        get :index
        expect(assigns(:subcategories)).to eq(subcategories)
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

  describe 'GET new' do

    context 'when user has permissions' do
      it "renders the new template" do
        get :new, xhr: true, format: :js
        expect(response).to render_template(:new)
      end

      it "returns http success" do
      post :index, xhr: true, format: :js
        expect(response).to have_http_status(:success)
      end

      it { should route(:get, '/categories/new').to(action: :new) }
    end

    context 'when user has not permissions' do
      it 'must render to another page'
    end
  end

  describe 'POST create' do

    context 'with valid attributes' do

      let(:valid_attributes) do
        {
            category: {
                name:        Faker::Lorem.characters(100)
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
        expect(assigns(:category)).to be_persisted
      end

      it 'saves an instance of category and assigns to category variable' do
        expect(assigns(:category)).to be_a(Category)
      end

      it 'saves the given values' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:category).name).to eq(valid_attributes[:category][:name])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to index view' do
        expect(response).to redirect_to(category_index_path)
      end

      #it 'must display a success message' do
        #expect(flash[:success]).to match(/ Éxito al crear la bitácora*/)
        #expect(flash[:success]).to be_present
      #end
    end

    context 'with invalid attributes' do

      let(:not_valid_attributes) do
        {
            category: {
                name:        nil,
            }
        }
      end

      before(:each) do
        post(
            :create,
            params: not_valid_attributes,
            format: :js
        )
      end

      it 'does not save an instance of category' do
        expect(response).not_to be_a_new(Category)
      end

      it 'renders new template' do
        expect(response).to render_template('new')
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
          @category_example = FactoryBot.create(:category)
        end

        before(:each) do
          get(
              :edit,
              params: { id: @category_example },
              xhr: true,
              format: :js
          )
        end

        it 'assigns @category' do
          expect(assigns(:category)).to eq(@category_example)
        end

        it 'renders the show template' do
          expect(response).to render_template('edit')
        end

        it 'return http found code' do
          expect(response).to have_http_status(:ok)
        end
      end

      context 'and record does not exist' do

        before(:each) do
          get(
              :index,
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

    context 'with valid attributes' do

      before(:each) do
        @category_example_update = FactoryBot.create(:category)
      end

      let(:valid_attributes) do
        {
            name:        Faker::Lorem.characters(100)
        }
      end

      before(:each) do
        put(
            :update,
            params: {:id => @category_example_update.to_param, :category => valid_attributes}
        )
      end

      it 'creates a new record' do
        expect(assigns(:category)).to be_persisted
      end

      it 'saves an instance of category and assigns to category variable' do
        expect(assigns(:category)).to be_a(Category)
      end

      it 'update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:category).name).to eq(valid_attributes[:name])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to category view' do
        expect(response).to redirect_to(category_index_path)
      end

      #it 'must display a success message' do
        #expect(flash[:success]).to match(/ Bitácora modificada correctamente*/)
        #expect(flash[:success]).to be_present
      #end
    end

    context 'with invalid attributes' do

      before(:each) do
        @category_example_update = FactoryBot.create(:category, name: 'update test')
      end

      # name is nil
      let(:not_valid_attributes) do
        {
            name:        nil
        }
      end

      before(:each) do
        put(
            :update,
            params: {:id => @category_example_update.to_param, :category => not_valid_attributes},
            format: :js
        )
      end

      it 'does not update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(@category_example_update.name).not_to eq(not_valid_attributes[:name])
      end

      it 'does not save an instance of category' do
        expect(response).not_to be_a_new(Category)
      end

      it 'renders edit template' do
        expect(response).to render_template("edit")
      end

      #it 'must display an error message' do
        #expect(flash[:error]).to be_present
        #expect(flash[:error]).to match(/ Error al modificar la bitácora*/)
      #end
    end
  end

  describe "DELETE destroy" do

    before(:each) do
      @category_example_delete = FactoryBot.create(:category, name: 'delete test')
    end

    context 'when user has permissions' do

      it "destroys the requested blog" do
        expect do
          delete :destroy, params: {:id => @category_example_delete.to_param}
        end.to change(Category, :count).by(-1)
      end

      it "redirects to the categories index" do
        delete :destroy, params: {:id => @category_example_delete.to_param.to_param}
        expect(response).to redirect_to(category_index_path)
      end

      #it 'must display a success message' do
        #delete :destroy, params: {:id => @category_example_delete.to_param.to_param}
        #expect(flash[:success]).to be_present
        #expect(flash[:success]).to match(/ Se ha eliminado la bitácora correctamente*/)
      #end
    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end

end
