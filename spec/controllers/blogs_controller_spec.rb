require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

  describe "GET index" do

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

      it { should route(:get, '/blogs').to(action: :index) }
    end

    context 'when user has not permissions' do
      it 'must to redirect to another page'
    end
  end

  describe "GET new" do

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
      it 'must to be rendered to another page'
    end
  end

  describe 'POST create' do

    context 'with valid attributes' do

      # valid payload
      let(:valid_attributes) do
        {
          blog: {
            name:        'Bitácora C23',
            description: 'Ejemplo de bitácora de prueba',
            units:       Date.today,
          }
        }
      end

      before(:each) do
        post(
          "create",
          params: valid_attributes
        )
      end

      it 'saves the new blog' do
        expect(assigns(:blog)).to be_a_new(Blog)
      end

      it 'saves the given values' do
        # compare if the record saved is the same that the given value
        expect(assigns(:blog).name).to eq(valid_attributes[:blog][:name])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(:ok)
      end

      it 'redirects to index view' do
        expect(response).to render_template(:new)
      end

      it { should route(:post, '/blogs').to(action: :create) }
    end

    context 'with invalid attributes' do
      it 'must to display an error message'

      it 'should not save the record'
    end
  end
end
