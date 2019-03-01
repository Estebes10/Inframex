require 'rails_helper'

RSpec.describe SubcategoriesController, type: :controller do

  before(:all)do
    create_user
  end

  after(:all)do
    delete_user
  end

  describe 'GET new' do

    before(:each) do
      sign_in(@user)
    end

    context 'when user has permissions' do

      it { should route(:get, '/subcategories/new').to(action: :new) }
    end

    context 'when user has not permissions' do
      it 'must render to another page'
    end
  end

  describe 'POST create' do

    before(:each) do
      sign_in(@user)
    end

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

    end
  end

  describe 'GET edit' do

    before(:each) do
      sign_in(@user)
    end

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

      end
    end

    context 'when user has not permissions' do
      it 'must to redirect to another pages'
      it 'must to display unauthorized '
    end
  end

  describe 'PATCH update' do

    before(:each) do
      sign_in(@user)
    end

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

    end
  end

end
