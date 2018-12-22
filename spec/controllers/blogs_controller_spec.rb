require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

  describe 'GET index' do

    before(:each) do
      sign_in()
    end

    context 'when user has permissions' do
      it "assigns @blogs" do
        blogs = Blog.order(:blog_date)
        get :index
        expect(assigns(:blogs)).to eq(blogs)
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
      sign_in()
    end

    context 'when user has permissions' do

      context 'and record exists' do

        before(:each) do
          @blog_example = FactoryBot.create(:blog)
        end

        before(:each) do
          get(
            :show,
            params: { id: @blog_example.id }
          )
        end

        it 'assigns @blog' do
          expect(assigns(:blog)).to eq(@blog_example)
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

    before(:each) do
      sign_in()
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

      it { should route(:get, '/blogs/new').to(action: :new) }
    end

    context 'when user has not permissions' do
      it 'must render to another page'
    end
  end

  describe 'POST create' do

    before(:each) do
      sign_in()
    end

    context 'with valid attributes' do

      let(:valid_attributes) do
        {
          blog: {
            name:        Faker::Lorem.characters(100),
            description: 'Ejemplo de bitácora de prueba',
            blog_date:   Date.today,
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
        expect(assigns(:blog)).to be_persisted
      end

      it 'saves an instance of blog and assigns to blog variable' do
        expect(assigns(:blog)).to be_a(Blog)
      end

      it 'saves the given values' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:blog).name).to eq(valid_attributes[:blog][:name])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to index view' do
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        expect(response).to redirect_to(blogs_url)
      end

      it 'must display a success message' do
        expect(flash[:success]).to match(/ Éxito al crear la bitácora*/)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid attributes' do

      let(:not_valid_attributes) do
        {
          blog: {
            name:        nil,
            description: 'Ejemplo de bitácora de prueba',
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

      it 'does not save an instance of blog' do
        expect(response).not_to be_a_new(Blog)
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

    before(:each) do
      sign_in()
    end

    context 'when user has permissions' do

      context 'and record exists' do

        before(:each) do
          @blog_example = FactoryBot.create(:blog)
        end

        before(:each) do
          get(
            :edit,
            params: { id: @blog_example }
          )
        end

        it 'assigns @blog' do
          expect(assigns(:blog)).to eq(@blog_example)
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

    before(:each) do
      sign_in()
    end

    context 'with valid attributes' do

      before(:each) do
        @blog_example_update = FactoryBot.create(:blog)
      end

      let(:valid_attributes) do
        {
            name:        Faker::Lorem.characters(100),
            description: 'Ejemplo de bitácora de prueba',
            date:        Date.today,
        }
      end

      before(:each) do
        put(
          :update,
          params: {:id => @blog_example_update.to_param, :blog => valid_attributes}
        )
      end

      it 'creates a new record' do
        expect(assigns(:blog)).to be_persisted
      end

      it 'saves an instance of blog and assigns to blog variable' do
        expect(assigns(:blog)).to be_a(Blog)
      end

      it 'update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:blog).name).to eq(valid_attributes[:name])
        expect(assigns(:blog).description).to eq(valid_attributes[:description])
        expect(assigns(:blog).date).to eq(valid_attributes[:date])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to blog view' do
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        expect(response).to redirect_to(blog_url(@blog_example_update))
      end

      it 'must display a success message' do
        expect(flash[:success]).to match(/ Bitácora modificada correctamente*/)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid attributes' do

      before(:each) do
        @blog_example_update = FactoryBot.create(:blog, name: 'update test')
      end

      # send string to blog date
      let(:not_valid_attributes) do
        {
            name:        'No debería cambiar este nombre por la fecha no valida',
            description: 'Ejemplo de bitácora de prueba',
            date:        'Fecha no válida',
        }
      end

      before(:each) do
        put(
          :update,
          params: {:id => @blog_example_update.to_param, :blog => not_valid_attributes}
        )
      end

      it 'does not update the attributes' do
        # compare if the record saved is the same that valid attributes
        expect(@blog_example_update.name).not_to eq(not_valid_attributes[:name])
        expect(@blog_example_update.description).not_to eq(not_valid_attributes[:description])
        expect(@blog_example_update.date).not_to eq(not_valid_attributes[:date])
      end

      it 'does not save an instance of blog' do
        expect(response).not_to be_a_new(Blog)
      end

      it 'renders new template' do
        #expect(response).to redirect_to(Blog.last)
        #expect(response).to render_template(:index)
        expect(response).to render_template("edit")
      end

      it 'must display an error message' do
        expect(flash[:error]).to be_present
        expect(flash[:error]).to match(/ Error al modificar la bitácora*/)
      end
    end
  end

  describe "DELETE destroy" do

    before(:each) do
      sign_in()
    end

    before(:each) do
      @blog_example_delete = FactoryBot.create(:blog, name: 'delete test')
    end

    context 'when user has permissions' do

      it "destroys the requested blog" do
        expect do
          delete :destroy, params: {:id => @blog_example_delete.to_param}
        end.to change(Blog, :count).by(-1)
      end

      it "redirects to the posts list" do
        delete :destroy, params: {:id => @blog_example_delete.to_param.to_param}
        expect(response).to redirect_to(blogs_url)
      end

      it 'must display a success message' do
        delete :destroy, params: {:id => @blog_example_delete.to_param.to_param}
        expect(flash[:success]).to be_present
        expect(flash[:success]).to match(/ Se ha eliminado la bitácora correctamente*/)
      end
    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end
end
