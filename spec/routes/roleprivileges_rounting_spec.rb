require "rails_helper"

RSpec.describe 'routes for roles', :type => :routing do

  context 'for new action' do
    it 'should route to /roleprivileges/:idRole/new' do
      expect(:get => '/roleprivileges/:idRole/new').to be_routable
    end

    it 'routes /roleprivileges/:idRole/new to roles controller' do
      expect(get('roleprivileges/:idRole/new')).to route_to(
                                                    :controller => "roleprivileges",
                                                    :action => "new",
                                                    :idRole => ":idRole"
                                                )
    end
  end

  context 'for create action' do
    it 'should route to /roleprivileges/:idRole/new' do
      expect(:post => '/roleprivileges/:idRole/new').to be_routable
    end

    it 'routes /roleprivileges/:idRole/new to roles controller' do
      expect(post('roleprivileges/:idRole/new')).to route_to(
                                                    :controller => "roleprivileges",
                                                    :action => "create",
                                                    :idRole => ":idRole"
                                                )
    end
  end

  context 'for destroy action' do
    it 'should route to /role/:idRole/privilege/:idPrivilege' do
      expect(:delete => '/role/:idRole/privilege/:idPrivilege').to be_routable
    end

    it 'routes /role/:idRole/privilege/:idPrivilege to roles controller' do
      expect(delete('/role/:idRole/privilege/:idPrivilege')).to route_to(
                                                    :controller => "roleprivileges",
                                                    :action => "destroy",
                                                    :idRole => ":idRole",
                                                    :idPrivilege => ":idPrivilege"
                                                )
    end
  end
end
