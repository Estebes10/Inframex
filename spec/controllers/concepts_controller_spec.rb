require 'rails_helper'

RSpec.describe ConceptsController, type: :controller do
  describe 'GET index' do
    context 'when user has permissions' do

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
          @concept_example = FactoryBot.create(:concept)
        end

        before(:each) do
          get(
              :show,
              params: { id: @concept_example.id }
          )
        end

        it 'assigns @concept_example' do
          expect(assigns(:concept)).to eq(@concept_example)
        end

        it 'renders the show template' do
          expect(response).to render_template(:show)
        end

        it 'return http found code' do
          expect(response).to have_http_status(:ok)
        end
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

      it { should route(:get, '/concepts/new').to(action: :new) }
    end

    context 'when user has not permissions' do
      it 'must render to another page'
    end
  end

  describe 'POST create' do

    context 'with valid attributes' do


      let(:valid_attributes) do
        {
            concept: {
                code:           Faker::Lorem.characters(6),
                description:    Faker::Lorem.characters(200),
                unity:          'kgs',
                unit_price:     10.50,
                total:          100.50,
                quantity:       10,
                category_id:    1
            }
        }
      end

      before(:each) do
        post(
            :create,
            params: valid_attributes
        )
      end

      it 'saves an instance of concept and assigns to concept variable' do
        expect(assigns(:concept)).to be_a(Concept)
      end

      it 'saves the given values' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:concept).code).to eq(valid_attributes[:concept][:code])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(200)
      end

      it 'redirects to index view' do
        expect(response).to render_template(:new)
      end

    end

    context 'with invalid attributes' do

      let(:not_valid_attributes) do
        {
            concept: {
                code:           Faker::Lorem.characters(6),
                description:    Faker::Lorem.characters(200),
                unity:          'kgs',
                unit_price:     10.50,
                total:          100.50,
                quantity:       10,
                category_id:    nil
            }
        }
      end

      before(:each) do
        post(
            :create,
            params: not_valid_attributes
        )
      end

      it 'does not save an instance of concept' do
        expect(response).not_to be_a_new(Concept)
      end

      it 'renders new template' do
        expect(response).to render_template("new")
      end

    end
  end

  describe 'GET edit' do

    context 'when user has permissions' do

      context 'and record exists' do

        before(:each) do
          @concept_example = FactoryBot.create(:concept)
        end

        before(:each) do
          get(
              :edit,
              params: { id: @concept_example.id }
          )
        end

        it 'assigns @concept' do
          expect(assigns(:concept)).to eq(@concept_example)
        end

        it 'renders the edit template' do
          expect(response).to render_template(:edit)
        end

        it 'return http found code' do
          expect(response).to have_http_status(:ok)
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
        @concept_example_update = FactoryBot.create(:concept)
      end

      let(:valid_attributes) do
        {
            code:           Faker::Lorem.characters(6),
            description:    Faker::Lorem.characters(200),
            unity:          'kgs',
            unit_price:     10.50,
            total:          200.50,
            quantity:       20,
            category_id:    1
        }
      end

      before(:each) do
        put(
            :update,
            params: {:id => @concept_example_update.to_param, :concept => valid_attributes}
        )
      end

      it 'creates a new record' do
        expect(assigns(:concept)).to be_persisted
      end

      it 'saves an instance of concept and assigns to concept variable' do
        expect(assigns(:concept)).to be_a(Concept)
      end

      it 'update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:concept).code).to eq(valid_attributes[:code])
        expect(assigns(:concept).unity).to eq(valid_attributes[:unity])
        expect(assigns(:concept).unit_price).to eq(valid_attributes[:unit_price])
        expect(assigns(:concept).quantity).to eq(valid_attributes[:quantity])
        expect(assigns(:concept).category_id).to eq(valid_attributes[:category_id])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(200)
      end

      it 'redirects to concept view' do
        expect(response).to render_template(:edit)
      end

    end

    context 'with invalid attributes' do

      before(:each) do
        @concept_example_update = FactoryBot.create(:concept, code: 'update')
      end

      # send string to blog date
      let(:not_valid_attributes) do
        {
            code:           Faker::Lorem.characters(6),
            description:    Faker::Lorem.characters(200),
            unity:          'kgs',
            unit_price:     10.50,
            total:          100.50,
            quantity:       10,
            category_id:    nil
        }
      end

      before(:each) do
        put(
            :update,
            params: {:id => @concept_example_update.to_param, :concept => not_valid_attributes}
        )
      end

      it 'does not update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(@concept_example_update.code).not_to eq(not_valid_attributes[:code])
        expect(@concept_example_update.unity).not_to eq(not_valid_attributes[:unity])
        expect(@concept_example_update.unit_price).not_to eq(not_valid_attributes[:unit_price])
        expect(@concept_example_update.total).not_to eq(not_valid_attributes[:total])
        expect(@concept_example_update.quantity).not_to eq(not_valid_attributes[:quantity])
        expect(@concept_example_update.category_id).not_to eq(not_valid_attributes[:category_id])

      end

      it 'does not save an instance of concept' do
        expect(response).not_to be_a_new(Concept)
      end

      it 'renders new template' do
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        expect(response).to render_template("edit")
      end

    end
  end

  describe "DELETE destroy" do

    before(:each) do
      @concept_example_delete = FactoryBot.create(:concept, code: 'delete')
    end

    context 'when user has permissions' do

      it "destroys the requested blog" do
        expect do
          delete :destroy, params: {:id => @concept_example_delete.to_param}
        end.to change(Concept, :count).by(-1)
      end

      it "redirects to the posts list" do
        delete :destroy, params: {:id => @concept_example_delete.to_param.to_param}
        expect(response).to redirect_to(concepts_path)
      end

    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end
end
