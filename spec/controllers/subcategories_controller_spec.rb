require 'rails_helper'

RSpec.describe SubcategoriesController, type: :controller do

  describe 'GET new' do

    context 'when user has permissions' do
      it "renders the new template" do
        get :new, xhr: true, format: :js
        expect(response).to render_template(:new)
      end

      it { should route(:get, '/subcategories/new').to(action: :new) }
    end

    context 'when user has not permissions' do
      it 'must render to another page'
    end
  end

  describe 'POST create' do

    context 'with valid attributes' do

      let(:valid_attributes) do
        {
            subcategory: {
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
        expect(assigns(:subcategory)).to be_persisted
      end

      it 'saves an instance of subcategory and assigns to subcategory variable' do
        expect(assigns(:subcategory)).to be_a(Subcategory)
      end

      it 'saves the given values' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:subcategory).name).to eq(valid_attributes[:subcategory][:name])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to index view' do
        expect(response).to redirect_to(categories_path)
      end

      #it 'must display a success message' do
      #expect(flash[:success]).to match(/ Éxito al crear la bitácora*/)
      #expect(flash[:success]).to be_present
      #end
    end

    context 'with invalid attributes' do

      let(:not_valid_attributes) do
        {
            subcategory: {
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

      it 'does not save an instance of subcategory' do
        expect(response).not_to be_a_new(Subcategory)
      end

      it 'renders new template' do
        expect(response).to render_template('new')
      end

      #it 'must display an error message' do
      #expect(flash[:danger]).to be_present
      #end
    end
  end

  describe 'GET edit' do

    context 'when user has permissions' do

      context 'and record exists' do

        before(:each) do
          @subcategory_example = FactoryBot.create(:subcategory)
        end

        before(:each) do
          get(
              :edit,
              params: { id: @subcategory_example },
              xhr: true,
              format: :js
          )
        end

        it 'assigns @subcategory' do
          expect(assigns(:subcategory)).to eq(@subcategory_example)
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

        #it 'should respond with not found code' do
        #expect(response).to have_http_status(404)
        #end

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
        @subcategory_example_update = FactoryBot.create(:subcategory)
      end

      let(:valid_attributes) do
        {
            name:        Faker::Lorem.characters(100)
        }
      end

      before(:each) do
        put(
            :update,
            params: {:id => @subcategory_example_update.to_param, :subcategory => valid_attributes}
        )
      end

      it 'creates a new record' do
        expect(assigns(:subcategory)).to be_persisted
      end

      it 'saves an instance of subcategory and assigns to subcategory variable' do
        expect(assigns(:subcategory)).to be_a(Subcategory)
      end

      it 'update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:subcategory).name).to eq(valid_attributes[:name])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to category view' do
        expect(response).to redirect_to(categories_path)
      end

      #it 'must display a success message' do
      #expect(flash[:success]).to match(/ Bitácora modificada correctamente*/)
      #expect(flash[:success]).to be_present
      #end
    end

    context 'with invalid attributes' do

      before(:each) do
        @subcategory_example_update = FactoryBot.create(:subcategory, name: 'update test')
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
            params: {:id => @subcategory_example_update.to_param, :subcategory => not_valid_attributes},
            format: :js
        )
      end

      it 'does not update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(@subcategory_example_update.name).not_to eq(not_valid_attributes[:name])
      end

      it 'does not save an instance of subcategory' do
        expect(response).not_to be_a_new(Subcategory)
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
      @subcategory_example_delete = FactoryBot.create(:subcategory, name: 'delete test')
    end

    context 'when user has permissions' do

      #it "destroys the requested blog" do
        #expect do
          #delete :destroy, params: {:id => @subcategory_example_delete.to_param}
        #end.to change(Subcategory, :count).by(-1)
      #end

    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end
  
end
