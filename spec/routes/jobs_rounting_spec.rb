require "rails_helper"

RSpec.describe 'routes for jobs', :type => :routing do

  context 'for index action' do
    it 'should route to /projects/:project_id/blogs/:blog_id/jobs' do
      expect(:get => "/projects/:project_id/blogs/:blog_id/jobs").to be_routable
    end

    it 'routes /projects/:project_id/blogs/:id/jobs to blogs controller' do
      expect(get('/projects/:project_id/blogs/:blog_id/jobs')).to route_to(
        :controller => "jobs",
        :action => "index",
        :project_id => ":project_id",
        :blog_id => ":blog_id"
      )
    end
  end

  context 'for new action' do
    it 'should route to /projects/:project_id/blogs/:blog_id/jobs/new' do
      expect(:get => '/projects/:project_id/blogs/:blog_id/jobs/new').to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(get('/projects/:project_id/blogs/:blog_id/jobs/new/:concept_id')).to route_to(
        :controller => "jobs",
        :action => "new",
        :project_id => ":project_id",
        :blog_id => ":blog_id",
        :concept_id => ":concept_id"
      )
    end
  end

  context 'for create action' do
    it 'should route to /projects/:project_id/blogs/:id/jobs' do
      expect(:post => '/projects/:project_id/blogs/:id/jobs').to be_routable
    end

    it 'routes /projects/:project_id/blogs/:blog_id/jobs to blogs controller' do
      expect(post('/projects/:project_id/blogs/:blog_id/jobs')).to route_to(
        :controller => "jobs",
        :action => "create",
        :project_id => ":project_id",
        :blog_id => ":blog_id"
      )
    end
  end

  context 'for show action' do
    it "should route to /projects/:project_id/blogs/:blog_id/jobs/:id" do
      expect(:get => '/projects/:project_id/blogs/:blog_id/jobs/:id').to be_routable
    end

    it 'routes /projects/:project_id/blogs/:blog_id/jobs/:id to blogs controller' do
      expect(get('/projects/:project_id/blogs/:blog_id/jobs/:id')).to route_to(
        :controller => "jobs",
        :project_id => ":project_id",
        :blog_id => ":blog_id",
        :action => "show",
        :id => ":id"
      )
    end
  end

  context 'for edit action' do
    it 'should route to /projects/:project_id/blogs/:blog_id/jobs/:id' do
      expect(:get => "/projects/:project_id/blogs/:blog_id/jobs/:id/edit").to be_routable
    end

    it 'routes /projects/:project_id/blogs/:blog_id/jobs/:id/edit to blogs controller' do
      expect(get("/projects/:project_id/blogs/:blog_id/jobs/:id/edit")).to route_to(
        :controller => "jobs",
        :action => "edit",
        :project_id => ":project_id",
        :blog_id => ":blog_id",
        :id => ":id"
      )
    end
  end

  context 'for update action' do
    it 'should route to /projects/:project_id/blogs/:blog_id/jobs' do
      expect(:patch => '/projects/:project_id/blogs/:blog_id/jobs/1').to be_routable
    end

    it 'routes /projects/:project_id/blogs/:id/jobs to jobs controller' do
      expect(patch('/projects/:project_id/blogs/:blog_id/jobs/:id')).to route_to(
        :controller => "jobs",
        :action => "update",
        :project_id => ":project_id",
        :blog_id => ":blog_id",
        :id => ":id"
      )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/projects/:project_id/blogs/:blog_id/jobs/:id").to be_routable
    end

    it 'routes /projects/:project_id/blogs/:blog_id/jobs/:id to jobs controller' do
      expect(delete('/projects/:project_id/blogs/:blog_id/jobs/:id')).to route_to(
        :controller => "jobs",
        :action => "destroy",
        :blog_id => ":blog_id",
        :project_id => ":project_id",
        :id => ":id"
      )
    end
  end

end
