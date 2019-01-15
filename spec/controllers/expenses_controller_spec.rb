require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do

  before(:each)do
    @project = FactoryBot.create(:project)
    @supplier = FactoryBot.create(:supplier)
    @category = FactoryBot.create(:category)
    @subcategory = FactoryBot.create(:subcategory)
    @blog = FactoryBot.create(:blog, project_id: @project.id)
    @concept = FactoryBot.create(:concept, category_id: @category.id, project_id: @project.id)
  end

  describe 'GET show' do

    context 'when user has permissions' do

      context 'and record exists' do

        before(:each) do
          @expense_example = FactoryBot.create(
            :expense,
            blog_id: @blog.id,
            supplier_id: @supplier.id,
            concept_id: @concept.id,
            subcategory_id: @subcategory.id
          )
        end

        before(:each) do
          get(
              :show,
              params: { project_id: @project.id, blog_id: @blog.id, id: @expense_example.id }
          )
        end

        it 'assigns @expense_example' do
          expect(assigns(:expense)).to eq(@expense_example)
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
        get(
            :new,
            params: { project_id: @project.id, blog_id: @blog.id }
        )
        expect(response).to render_template(:new)
      end

      it "returns http success" do
        get(
            :new,
            params: { project_id: @project.id, blog_id: @blog.id }
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

      let(:valid_attributes) do
        {
          project_id: @project.id,
          blog_id: @blog.id,
            expense: {
                name:        Faker::Lorem.characters(100),
                date:        Date.today,
                unity:       'kgs',
                unit_price:  10.50,
                quantity:    10,
                status:      true,
                status_ticket: true,
                subcategory_id: @subcategory.id,
                supplier_id:    @supplier.id
            }
        }
      end

      before(:each) do
        post(
            :create,
            params: valid_attributes
        )
      end

      it 'saves an instance of expense and assigns to expense variable' do
        expect(assigns(:expense)).to be_a(Expense)
      end

      it 'saves the given values' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:expense).name).to eq(valid_attributes[:expense][:name])
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
            expense: {
                name:        Faker::Lorem.characters(100),
                date:        Date.today,
                unity:       'kgs',
                unit_price:  10.50,
                quantity:    10,
                status:      true,
                status_ticket: true,
                subcategory_id: nil,
                supplier_id:    nil
            }
        }
      end

      before(:each) do
        post(
            :create,
            params: { project_id: @project.id, blog_id: @blog.id, expense: not_valid_attributes }
        )
      end

      it 'does not save an instance of expense' do
        expect(response).not_to be_a_new(Expense)
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
          @expense_example = FactoryBot.create(
            :expense,
            blog_id: @blog.id,
            supplier_id: @supplier.id,
            concept_id: @concept.id,
            subcategory: @subcategory.id
          )
        end

        before(:each) do
          get(
              :edit,
              params: { project_id: @project.id, blog_id: @blog.id, id: @expense_example.id }
          )
        end

        it 'assigns @expense' do
          expect(assigns(:expense)).to eq(@expense_example)
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
        @expense_example = FactoryBot.create(
          :expense,
          blog_id: @blog.id,
          supplier_id: @supplier.id,
          concept_id: @concept.id,
          subcategory: @subcategory.id
        )
      end

      let(:valid_attributes) do
        {
                name:        Faker::Lorem.characters(100),
                date:        Date.today,
                unity:       'kgs',
                unit_price:  10.50,
                quantity:    10,
                status:      true,
                status_ticket: true,
                subcategory_id: 1,
                supplier_id:    1
        }
      end

      before(:each) do
        put(
            :update,
            params: {:project_id => @project.id, :blog_id => @blog.id,
                     :id => @expense_example_update.to_param, :expense => valid_attributes}
        )
      end

      it 'creates a new record' do
        expect(assigns(:expense)).to be_persisted
      end

      it 'saves an instance of expense and assigns to expense variable' do
        expect(assigns(:expense)).to be_a(Expense)
      end

      it 'update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:expense).date).to eq(valid_attributes[:date])
        expect(assigns(:expense).unity).to eq(valid_attributes[:unity])
        expect(assigns(:expense).unit_price).to eq(valid_attributes[:unit_price])
        expect(assigns(:expense).quantity).to eq(valid_attributes[:quantity])
        expect(assigns(:expense).status).to eq(valid_attributes[:status])
        expect(assigns(:expense).status_ticket).to eq(valid_attributes[:status_ticket])
        expect(assigns(:expense).subcategory_id).to eq(valid_attributes[:subcategory_id])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(200)
      end

      it 'redirects to expense view' do
        expect(response).to render_template(:edit)
      end

    end

    context 'with invalid attributes' do

      before(:each) do
        @expense_example_update = FactoryBot.create(
          :expense,
          name: 'update test',
          blog_id: @blog.id,
          supplier_id: @supplier.id,
          concept_id: @concept.id,
          subcategory: @subcategory.id
        )
      end

      # send string to blog date
      let(:not_valid_attributes) do
        {
            name:        Faker::Lorem.characters(100),
            date:        Date.today,
            unity:       'kgs',
            unit_price:  10.50,
            quantity:    10,
            status:      true,
            status_ticket: true,
            subcategory_id: nil,
            supplier_id:    nil
        }
      end

      before(:each) do
        put(
            :update,
            params: {:project_id => @project.id, :blog_id => @blog.id,
                     :id => @expense_example_update.to_param, :expense => not_valid_attributes}
        )
      end

      it 'does not update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(@expense_example_update.name).not_to eq(not_valid_attributes[:name])
        expect(@expense_example_update.unity).not_to eq(not_valid_attributes[:unity])
        expect(@expense_example_update.unit_price).not_to eq(not_valid_attributes[:unit_price])
        expect(@expense_example_update.total).not_to eq(not_valid_attributes[:total])
        expect(@expense_example_update.quantity).not_to eq(not_valid_attributes[:quantity])
        expect(@expense_example_update.subcategory_id).not_to eq(not_valid_attributes[:subcategory_id])
        expect(@expense_example_update.supplier_id).not_to eq(not_valid_attributes[:supplier_id])

      end

      it 'does not save an instance of expense' do
        expect(response).not_to be_a_new(Expense)
      end

      it 'renders new template' do
        expect(response).to render_template("edit")
      end

    end
  end

  describe "DELETE destroy" do

    before(:each) do
      @expense_example_delete = FactoryBot.create(
        :expense,
        name: 'delete test',
        blog_id: @blog.id,
        supplier_id: @supplier.id,
        concept_id: @concept.id,
        subcategory: @subcategory.id
      )
    end

    context 'when user has permissions' do

      it "destroys the requested blog" do
        expect do
          delete :destroy, params: {:project_id => @project.id, :blog_id => @blog.id,
                                    :id => @expense_example_delete.to_param}
        end.to change(Expense, :count).by(-1)
      end

      it "redirects to the posts list" do
        delete :destroy, params: {:project_id => @project.id, :blog_id => @blog.id,
                                  :id => @expense_example_delete.to_param}
        expect(response).to redirect_to(project_blog_url(project_id: @project.id, id: @blog.id))
      end

    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end

end
