require "rails_helper"

RSpec.describe 'routes for concepts', :type => :routing do

  context 'for index action' do
    it 'should route to /projects/:id/concepts' do
      expect(:get => "/projects/:id/concepts").to be_routable
    end

    it 'routes /concepts to concepts controller' do
      expect(get('/projects/:id/concepts')).to route_to(
                                                :controller => "concepts",
                                                :action => "index",
                                                :project_id => ":id"
                                            )
    end
  end
  context 'for show action' do
    it 'should route to /projects/:project_id/concepts/:id' do
      expect(:get => '/projects/:project_id/concepts/:id').to be_routable
    end

    it 'routes /concepts/:id to concepts controller' do
      expect(get("/projects/:project_id/concepts/:id")).to route_to(
                                          :controller => "concepts",
                                          :action => "show",
                                          :id => ":id",
                                          :project_id => ":project_id"
                                      )
    end
  end
  context 'for new action' do
    it 'should route to /projects/:project_id/concepts/new' do
      expect(:get => '/projects/:project_id/concepts/new').to be_routable
    end

    it 'routes /concepts to concepts controller' do
      expect(get('/projects/:project_id/concepts/new')).to route_to(
                                         :controller => "concepts",
                                         :action => "new",
                                         :project_id => ":project_id")
    end
  end

  context 'for create action' do
    it 'should route to /projects/:project_id/concepts' do
      expect(:post => '/projects/:project_id/concepts').to be_routable
    end

    it 'routes /concepts to concepts controller' do
      expect(post('/projects/:project_id/concepts')).to route_to(
                                                            :controller => "concepts",
                                                            :action => "create",
                                                            :project_id => ":project_id"
                                                        )
    end
  end

  context 'for edit action' do
    it 'should route to /projects/:project_id/concepts/:id' do
      expect(:get => "/projects/:project_id/concepts/:id/edit").to be_routable
    end

    it 'routes /concepts/:id/edit to concepts controller' do
      expect(get("/projects/:project_id/concepts/:id/edit")).to route_to(
                                               :controller => "concepts",
                                               :action => "edit",
                                               :id => ":id",
                                               :project_id => ":project_id"
                                           )
    end
  end

  context 'for update action' do
    it 'should route to /projects/:project_id/concepts/:id' do
      expect(:patch => '/projects/:project_id/concepts/1').to be_routable
    end

    it 'routes /concepts to concepts controller' do
      expect(patch('/projects/:project_id/concepts/:id')).to route_to(
                                           :controller => "concepts",
                                           :action => "update",
                                           :id => ":id",
                                           :project_id => ":project_id"
                                       )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/projects/:project_id/concepts/:id").to be_routable
    end

    it 'routes /concepts to concepts controller' do
      expect(delete('/projects/:project_id/concepts/:id')).to route_to(
                                            :controller => "concepts",
                                            :action => "destroy",
                                            :id => ":id",
                                            :project_id => ":project_id"
                                        )
    end
  end

end