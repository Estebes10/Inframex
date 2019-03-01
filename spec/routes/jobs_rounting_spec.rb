require "rails_helper"

RSpec.describe 'routes for jobs', :type => :routing do

  context 'for index action' do
    it 'should route to /projects/:project_id/concepts/:concept_id/jobs' do
      expect(:get => "/projects/:project_id/concepts/:concept_id/jobs").to be_routable
    end

    it 'routes /projects/:project_id/concepts/:id/jobs to concepts controller' do
      expect(get('/projects/:project_id/concepts/:concept_id/jobs')).to route_to(
        :controller => "jobs",
        :action => "index",
        :project_id => ":project_id",
        :concept_id => ":concept_id"
      )
    end
  end

  context 'for new action' do
    it 'should route to /projects/:project_id/concepts/:concept_id/jobs/new' do
      expect(:get => '/projects/:project_id/concepts/:concept_id/jobs/new').to be_routable
    end

    it 'routes /projects/:project_id/concepts/:concept_id/jobs/new to concepts controller' do
      expect(get('/projects/:project_id/concepts/:concept_id/jobs/new')).to route_to(
        :controller => "jobs",
        :action => "new",
        :project_id => ":project_id",
        :concept_id => ":concept_id"
      )
    end
  end

  context 'for create action' do
    it 'should route to /projects/:project_id/concepts/:id/jobs' do
      expect(:post => '/projects/:project_id/concepts/:id/jobs').to be_routable
    end

    it 'routes /projects/:project_id/concepts/:concept_id/jobs to concepts controller' do
      expect(post('/projects/:project_id/concepts/:concept_id/jobs')).to route_to(
        :controller => "jobs",
        :action => "create",
        :project_id => ":project_id",
        :concept_id => ":concept_id"
      )
    end
  end

  context 'for show action' do
    it "should route to /projects/:project_id/concepts/:concept_id/jobs/:id" do
      expect(:get => '/projects/:project_id/concepts/:concept_id/jobs/:id').to be_routable
    end

    it 'routes /projects/:project_id/concepts/:concept_id/jobs/:id to concepts controller' do
      expect(get('/projects/:project_id/concepts/:concept_id/jobs/:id')).to route_to(
        :controller => "jobs",
        :project_id => ":project_id",
        :concept_id => ":concept_id",
        :action => "show",
        :id => ":id"
      )
    end
  end

  context 'for edit action' do
    it 'should route to /projects/:project_id/concepts/:concept_id/jobs/:id' do
      expect(:get => "/projects/:project_id/concepts/:concept_id/jobs/:id/edit").to be_routable
    end

    it 'routes /projects/:project_id/concepts/:concept_id/jobs/:id/edit to concepts controller' do
      expect(get("/projects/:project_id/concepts/:concept_id/jobs/:id/edit")).to route_to(
        :controller => "jobs",
        :action => "edit",
        :project_id => ":project_id",
        :concept_id => ":concept_id",
        :id => ":id"
      )
    end
  end

  context 'for update action' do
    it 'should route to /projects/:project_id/concepts/:concept_id/jobs' do
      expect(:patch => '/projects/:project_id/concepts/:concept_id/jobs/1').to be_routable
    end

    it 'routes /projects/:project_id/concepts/:id/jobs to jobs controller' do
      expect(patch('/projects/:project_id/concepts/:concept_id/jobs/:id')).to route_to(
        :controller => "jobs",
        :action => "update",
        :project_id => ":project_id",
        :concept_id => ":concept_id",
        :id => ":id"
      )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/projects/:project_id/concepts/:concept_id/jobs/:id").to be_routable
    end

    it 'routes /projects/:project_id/concepts/:concept_id/jobs/:id to jobs controller' do
      expect(delete('/projects/:project_id/concepts/:concept_id/jobs/:id')).to route_to(
        :controller => "jobs",
        :action => "destroy",
        :concept_id => ":concept_id",
        :project_id => ":project_id",
        :id => ":id"
      )
    end
  end

end
