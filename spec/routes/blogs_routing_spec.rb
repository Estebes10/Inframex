require "rails_helper"

RSpec.describe 'routes for blogs', :type => :routing do

  context 'for index action' do
    it 'should route to /projects/:id/blogs' do
      expect(:get => "/projects/:id/blogs").to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(get('/projects/:id/blogs')).to route_to(
        :controller => "blogs",
        :action => "index",
        :project_id => ":id"
      )
    end
  end

  context 'for new action' do
    it 'should route to /projects/:id/blogs/new' do
      expect(:get => '/projects/:id/blogs/new').to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(get('/projects/:id/blogs/new')).to route_to(
        :controller => "blogs",
        :action => "new",
        :project_id => ":id"
      )
    end
  end

  context 'for create action' do
    it 'should route to /projects/:id/blogs' do
      expect(:post => '/projects/:id/blogs').to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(post('/projects/:id/blogs')).to route_to(
        :controller => "blogs",
        :action => "create",
        :project_id => ":id"
      )
    end
  end

  context 'for show action' do
    it "should route to /projects/:project_id/blogs/:id" do
      expect(:get => '/projects/:project_id/blogs/:id').to be_routable
    end

    it 'routes /blogs/:id to blogs controller' do
      expect(get('/projects/:project_id/blogs/:id')).to route_to(
        :controller => "blogs",
        :project_id => ":project_id",
        :action => "show",
        :id => ":id"
      )
    end
  end

  context 'for edit action' do
    it 'should route to /projects/:project_id/blogs/:id' do
      expect(:get => "/projects/:project_id/blogs/:id/edit").to be_routable
    end

    it 'routes /projects/:project_id/blogs/:id/edit to blogs controller' do
      expect(get("/projects/:project_id/blogs/:id/edit")).to route_to(
        :controller => "blogs",
        :action => "edit",
        :project_id => ":project_id",
        :id => ":id"
      )
    end
  end

  context 'for update action' do
    it 'should route to /projects/:project_id/blogs' do
      expect(:patch => '/projects/:project_id/blogs/1').to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(patch('/projects/:project_id/blogs/:id')).to route_to(
        :controller => "blogs",
        :action => "update",
        :project_id => ":project_id",
        :id => ":id"
      )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/projects/:project_id/blogs/:id").to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(delete('/projects/:project_id/blogs/:id')).to route_to(
        :controller => "blogs",
        :action => "destroy",
        :project_id => ":project_id",
        :id => ":id"
      )
    end
  end

end
