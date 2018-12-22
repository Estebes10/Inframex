require "rails_helper"

RSpec.describe 'routes for roles', :type => :routing do

  context 'for index action' do
    it 'should route to /roles' do
      expect(:get => '/roles').to be_routable
    end

    it 'routes /roles to roles controller' do
      expect(get('roles')).to route_to('roles#index')
    end
  end

  context 'for new action' do
    it 'should route to /roles/new' do
      expect(:get => '/roles/new').to be_routable
    end

    it 'routes /roles to roles controller' do
      expect(get('roles/new')).to route_to('roles#new')
    end
  end

  context 'for create action' do
    it 'should route to /roles' do
      expect(:post => '/roles').to be_routable
    end

    it 'routes /roles to roles controller' do
      expect(post('roles')).to route_to('roles#create')
    end
  end

  context 'for edit action' do
    it 'should route to /roles/:id' do
      expect(:get => "/roles/:id/edit").to be_routable
    end

    it 'routes /roles/:id/edit to roles controller' do
      expect(get("/roles/:id/edit")).to route_to(
                                                    :controller => "roles",
                                                    :action => "edit",
                                                    :id => ":id"
                                                )
    end
  end

  context 'for update action' do
    it 'should route to /roles/:id' do
      expect(:patch => '/roles/1').to be_routable
    end

    it 'routes /roles to roles controller' do
      expect(patch('roles/:id')).to route_to(
                                                :controller => "roles",
                                                :action => "update",
                                                :id => ":id"
                                            )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/roles/:id").to be_routable
    end

    it 'routes /roles to roles controller' do
      expect(delete('roles/:id')).to route_to(
                                                 :controller => "roles",
                                                 :action => "destroy",
                                                 :id => ":id"
                                             )
    end
  end

end
