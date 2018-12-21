require "rails_helper"

RSpec.describe 'routes for projects', :type => :routing do

  context 'for index action' do
    it 'should route to /projects' do
      expect(:get => '/projects').to be_routable
    end

    it 'routes /projects to projects controller' do
      expect(get('projects')).to route_to('projects#index')
    end
  end

  context 'for new action' do
    it 'should route to /projects/new' do
      expect(:get => '/projects/new').to be_routable
    end

    it 'routes /projects to projects controller' do
      expect(get('projects/new')).to route_to('projects#new')
    end
  end

  context 'for create action' do
    it 'should route to /projects' do
      expect(:post => '/projects').to be_routable
    end

    it 'routes /projects to projects controller' do
      expect(post('projects')).to route_to('projects#create')
    end
  end

  context 'for edit action' do
    it 'should route to /projects/:id' do
      expect(:get => "/projects/:id/edit").to be_routable
    end

    it 'routes /projects/:id/edit to projects controller' do
      expect(get("/projects/:id/edit")).to route_to(
                                                    :controller => "projects",
                                                    :action => "edit",
                                                    :id => ":id"
                                                )
    end
  end

  context 'for update action' do
    it 'should route to /projects/:id' do
      expect(:patch => '/projects/1').to be_routable
    end

    it 'routes /projects to projects controller' do
      expect(patch('projects/:id')).to route_to(
                                                :controller => "projects",
                                                :action => "update",
                                                :id => ":id"
                                            )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/projects/:id").to be_routable
    end

    it 'routes /projects to projects controller' do
      expect(delete('projects/:id')).to route_to(
                                                 :controller => "projects",
                                                 :action => "destroy",
                                                 :id => ":id"
                                             )
    end
  end

end
