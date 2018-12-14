require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do

  describe 'GET index' do

    context 'when user has permissions' do
      it "assigns @expenses" do
        expenses = Expense.all
        get :index
        expect(assigns(:expenses)).to eq(expenses)
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
        get :new
        expect(response).to render_template(:new)
      end

      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it { should route(:get, '/expenses/new').to(action: :new) }
    end

    context 'when user has not permissions' do
      it 'must render to another page'
    end
  end

  describe 'POST create' do

    context 'with valid attributes' do


      let(:valid_attributes) do
        {
            expense: {
                name:        Faker::Lorem.characters(100),
                date:        Date.today,
                unity:       'kgs',
                unit_price:  10.50,
                total:       100.50,
                quantity:    10,
                status:      true,
                status_ticket: true,
                subcategory_id: 1,
                supplier_id:    1
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
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        expect(response).to render_template(:new)
      end

      #it 'must display a success message' do
        #expect(flash[:success]).to match(/ Éxito al crear la bitácora*/)
        #expect(flash[:success]).to be_present
      #end
    end

    context 'with invalid attributes' do

      let(:not_valid_attributes) do
        {
            expense: {
                name:        Faker::Lorem.characters(100),
                date:        Date.today,
                unity:       'kgs',
                unit_price:  10.50,
                total:       100.50,
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
            params: not_valid_attributes
        )
      end

      it 'does not save an instance of expense' do
        expect(response).not_to be_a_new(Expense)
      end

      it 'renders new template' do
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        expect(response).to render_template("new")
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
          @expense_example = FactoryBot.create(:expense)
        end

        before(:each) do
          get(
              :edit,
              params: { id: @expense_example }
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
        @expense_example_update = FactoryBot.create(:expense)
      end

      let(:valid_attributes) do
        {
                name:        Faker::Lorem.characters(100),
                date:        Date.today,
                unity:       'kgs',
                unit_price:  10.50,
                total:       100.50,
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
            params: {:id => @expense_example_update.to_param, :expense => valid_attributes}
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
        expect(assigns(:expense).name).to eq(valid_attributes[:name])
        expect(assigns(:expense).date).to eq(valid_attributes[:date])
        expect(assigns(:expense).unity).to eq(valid_attributes[:unity])
        expect(assigns(:expense).unit_price).to eq(valid_attributes[:unit_price])
        expect(assigns(:expense).total).to eq(valid_attributes[:total])
        expect(assigns(:expense).quantity).to eq(valid_attributes[:quantity])
        expect(assigns(:expense).status).to eq(valid_attributes[:status])
        expect(assigns(:expense).status_ticket).to eq(valid_attributes[:status_ticket])
        expect(assigns(:expense).subcategory_id).to eq(valid_attributes[:subcategory_id])
        expect(assigns(:expense).supplier_id).to eq(valid_attributes[:supplier_id])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(200)
      end

      it 'redirects to expense view' do
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        expect(response).to render_template(:edit)
      end

      #it 'must display a success message' do
        #expect(flash[:success]).to match(/ Bitácora modificada correctamente*/)
        #expect(flash[:success]).to be_present
      #end
    end

    context 'with invalid attributes' do

      before(:each) do
        @expense_example_update = FactoryBot.create(:expense, name: 'update test')
      end

      # send string to blog date
      let(:not_valid_attributes) do
        {
            name:        Faker::Lorem.characters(100),
            date:        Date.today,
            unity:       'kgs',
            unit_price:  10.50,
            total:       100.50,
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
            params: {:id => @expense_example_update.to_param, :expense => not_valid_attributes}
        )
      end

      it 'does not update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(@expense_example_update.name).not_to eq(not_valid_attributes[:name])
        expect(@expense_example_update.date).not_to eq(not_valid_attributes[:date])
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
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
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
      @expense_example_delete = FactoryBot.create(:expense, name: 'delete test')
    end

    context 'when user has permissions' do

      it "destroys the requested blog" do
        expect do
          delete :destroy, params: {:id => @expense_example_delete.to_param}
        end.to change(Expense, :count).by(-1)
      end

      it "redirects to the posts list" do
        delete :destroy, params: {:id => @expense_example_delete.to_param.to_param}
        expect(response).to redirect_to(expense_index_path)
      end

      #it 'must display a success message' do
        #delete :destroy, params: {:id => @expense_example_delete.to_param.to_param}
        #expect(flash[:success]).to be_present
        #expect(flash[:success]).to match(/ Se ha eliminado la bitácora correctamente*/)
      #end
    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end

end
