require "rails_helper"

RSpec.describe 'routes for blogs', :type => :routing do

  context 'for index action' do
    it 'should route to /blogs' do
      expect(:get => "/blogs").to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(get('/blogs')).to route_to('blogs#index')
    end
  end

  context 'for new action' do
    it 'should route to /blogs/new' do
      expect(:get => '/blogs/new').to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(get('blogs/new')).to route_to('blogs#new')
    end
  end

  context 'for create action' do
    it 'should route to /blogs' do
      expect(:post => '/blogs').to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(post('blogs')).to route_to('blogs#create')
    end
  end

  context 'for show action' do
    it "should route to /blogs/:id" do
      expect(:post => '/blogs').to be_routable
    end

    it 'routes /blogs/:id to blogs controller' do
      expect(get('blogs/:id')).to route_to(
        :controller => "blogs",
        :action => "show",
        :id => ":id"
      )
    end
  end

  context 'for edit action' do
    it 'should route to /blogs/:id' do
      expect(:get => "/blogs/:id/edit").to be_routable
    end

    it 'routes /blogs/:id/edit to blogs controller' do
      expect(get("/blogs/:id/edit")).to route_to(
        :controller => "blogs",
        :action => "edit",
        :id => ":id"
      )
    end
  end

  context 'for update action' do
    it 'should route to /blogs' do
      expect(:patch => '/blogs/1').to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(patch('blogs/:id')).to route_to(
        :controller => "blogs",
        :action => "update",
        :id => ":id"
      )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/blogs/:id").to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(delete('blogs/:id')).to route_to(
        :controller => "blogs",
        :action => "destroy",
        :id => ":id"
      )
    end
  end

end
