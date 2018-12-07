require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

  describe "GET index" do

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

end
