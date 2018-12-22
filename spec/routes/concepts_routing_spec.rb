require "rails_helper"

RSpec.describe 'routes for concepts', :type => :routing do

  context 'for show action' do
    it 'should route to /concepts/:id' do
      expect(:get => '/concepts/:id').to be_routable
    end

    it 'routes /concepts/:id to concepts controller' do
      expect(get("/concepts/:id")).to route_to(
                                          :controller => "concepts",
                                          :action => "show",
                                          :id => ":id"
                                      )
    end
  end
  context 'for new action' do
    it 'should route to /concepts/new' do
      expect(:get => '/concepts/new').to be_routable
    end

    it 'routes /concepts to concepts controller' do
      expect(get('concepts/new')).to route_to('concepts#new')
    end
  end

  context 'for create action' do
    it 'should route to /concepts' do
      expect(:post => '/concepts').to be_routable
    end

    it 'routes /concepts to concepts controller' do
      expect(post('concepts')).to route_to('concepts#create')
    end
  end

  context 'for edit action' do
    it 'should route to /concepts/:id' do
      expect(:get => "/concepts/:id/edit").to be_routable
    end

    it 'routes /concepts/:id/edit to concepts controller' do
      expect(get("/concepts/:id/edit")).to route_to(
                                               :controller => "concepts",
                                               :action => "edit",
                                               :id => ":id"
                                           )
    end
  end

  context 'for update action' do
    it 'should route to /concepts/:id' do
      expect(:patch => '/concepts/1').to be_routable
    end

    it 'routes /concepts to concepts controller' do
      expect(patch('concepts/:id')).to route_to(
                                           :controller => "concepts",
                                           :action => "update",
                                           :id => ":id"
                                       )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/concepts/:id").to be_routable
    end

    it 'routes /concepts to concepts controller' do
      expect(delete('concepts/:id')).to route_to(
                                            :controller => "concepts",
                                            :action => "destroy",
                                            :id => ":id"
                                        )
    end
  end

end