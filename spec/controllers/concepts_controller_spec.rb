require 'rails_helper'

RSpec.describe ConceptsController, type: :controller do

  before(:all)do
    create_user
  end

  after(:all)do
    delete_user
  end

  before(:each) do
    @project = FactoryBot.create(:project)
    @category = FactoryBot.create(:category)
  end

  describe 'GET show' do

    context 'when user has permissions' do

      before(:each) do
        sign_in(@user)
      end

      context 'and record exists' do

        before(:each) do
          @concept_example = @project.concepts.create(
            code:           Faker::Lorem.characters(6),
            description:    Faker::Lorem.characters(200),
            unity:          'kgs',
            unit_price:     10.50,
            quantity:       10,
            category_id:    @category.id,
            project_id:     @project.id,
            total:          100,
            weight:         50
          )
        end

        before(:each) do
          get(
              :show,
              params: { id: @concept_example.id, project_id: @concept_example.project.id }
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

      before(:each) do
        sign_in(@user)
      end

      it "renders the new template" do
        get(
            :new,
            params: { project_id: @project.id }
        )
        expect(response).to render_template(:new)
      end

      it "returns http success" do
        get(
            :new,
            params: { project_id: @project.id }
        )
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user has not permissions' do
      it 'must render to another page'
    end
  end

  describe 'POST create' do

    context 'with valid attributes' do

      before(:each) do
        sign_in(@user)
      end

      let(:valid_attributes) do
        {
            project_id: @project.id,
            concept: {
                code:           Faker::Lorem.characters(6),
                description:    Faker::Lorem.characters(200),
                unity:          'kgs',
                unit_price:     10.50,
                quantity:       10,
                category_id:    @category.id,
                project_id:     @project.id,
                total:          100,
                weight:         50
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
        expect(assigns(:concept).unity).to eq(valid_attributes[:concept][:unity])
        expect(assigns(:concept).quantity).to eq(valid_attributes[:concept][:quantity])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to project concepts' do
        expect(response).to redirect_to(project_url(@project , :anchor => "nav-concepts"))
      end

    end

    context 'with invalid attributes' do

      before(:each) do
        sign_in(@user)
      end

      let(:not_valid_attributes) do
        {
            concept: {
                code:           Faker::Lorem.characters(6),
                description:    Faker::Lorem.characters(200),
                unity:          'kgs',
                unit_price:     10.50,
                quantity:       10,
                category_id:    nil
            }
        }
      end

      before(:each) do
        post(
            :create,
            params: { project_id: @project.id, concept: not_valid_attributes }
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

      before(:each) do
        sign_in(@user)
      end

      context 'and record exists' do

        before(:each) do
          @concept_example = @project.concepts.create(
            code:           Faker::Lorem.characters(6),
            description:    Faker::Lorem.characters(200),
            unity:          'kgs',
            unit_price:     10.50,
            quantity:       10,
            category_id:    @category.id,
            project_id:     @project.id,
            total:          100,
            weight:         50
          )
        end

        before(:each) do
          get(
              :edit,
              params: { id: @concept_example.id, project_id: @project.id}
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
        sign_in(@user)
      end

      before(:each) do
        @concept_example_update = @project.concepts.create(
          code:           'update',
          description:    Faker::Lorem.characters(200),
          unity:          'kgs',
          unit_price:     10.50,
          quantity:       10,
          category_id:    @category.id,
          project_id:     @project.id,
          total:          100,
          weight:         50
        )
      end

      let(:valid_attributes) do
        {
            code:           Faker::Lorem.characters(6),
            description:    Faker::Lorem.characters(200),
            unity:          'kgs',
            unit_price:     10.50,
            quantity:       20,
            category_id:    @category.id,
        }
      end

      before(:each) do
        put(
            :update,
            params: {:id => @concept_example_update.to_param, project_id: @project.id, :concept => valid_attributes}
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
        expect(response).to have_http_status(302)
      end

      it 'redirects to concept view' do
        expect(response).to redirect_to project_url(@project , :anchor => "nav-concepts")
      end

    end

    context 'with invalid attributes' do

      before(:each) do
        sign_in(@user)
      end

      before(:each) do
        @concept_example_update = @project.concepts.create(
          code:           'update',
          description:    Faker::Lorem.characters(200),
          unity:          'kgs',
          unit_price:     10.50,
          quantity:       10,
          category_id:    @category.id,
          project_id:     @project.id,
          total:          100,
          weight:         50
        )
      end

      # send string to blog date
      let(:not_valid_attributes) do
        {
            code:           nil,
            description:    Faker::Lorem.characters(200),
            unity:          'kgs 2',
            unit_price:     10.51,
            quantity:       20,
            category_id:    nil,
        }
      end

      before(:each) do
        put(
            :update,
            params: {:id => @concept_example_update.to_param, project_id: @project.id, :concept => not_valid_attributes}
        )
      end

      it 'does not update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(@concept_example_update.code).not_to eq(not_valid_attributes[:code])
        expect(@concept_example_update.unity).not_to eq(not_valid_attributes[:unity])
        expect(@concept_example_update.unit_price).not_to eq(not_valid_attributes[:unit_price])
        expect(@concept_example_update.quantity).not_to eq(not_valid_attributes[:quantity])
        expect(@concept_example_update.category_id).not_to eq(not_valid_attributes[:category_id])
        expect(@concept_example_update.project_id).not_to eq(not_valid_attributes[:project_id])

      end

      it 'does not save an instance of concept' do
        expect(response).not_to be_a_new(Concept)
      end

      it 'renders new template' do
        expect(response).to render_template("edit")
      end

    end
  end

  describe "DELETE destroy" do

    before(:each) do
      sign_in(@user)
    end

    before(:each) do
      @concept_example_delete = @project.concepts.create(
        code:           Faker::Lorem.characters(6),
        description:    Faker::Lorem.characters(200),
        unity:          'kgs',
        unit_price:     10.50,
        quantity:       10,
        category_id:    @category.id,
        project_id:     @project.id,
        total:          100,
        weight:         50
      )
      #@concept_example_delete = FactoryBot.create(:concept, code: 'delete')
    end

    context 'when user has permissions' do

      it "destroys the requested blog" do
        expect do
          delete :destroy, params: {:project_id =>@project.id, :id => @concept_example_delete.to_param}
        end.to change(Concept, :count).by(-1)
      end

      it "redirects to the posts list" do
        delete :destroy, params: {:project_id =>@project.id, :id => @concept_example_delete.to_param}
        expect(response).to redirect_to(project_url(@project, :anchor => "nav-concepts"))
      end

    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end
end
