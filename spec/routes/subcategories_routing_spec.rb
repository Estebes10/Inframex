require "rails_helper"

RSpec.describe 'routes for subcategories', :type => :routing do

  context 'for new action' do
    it 'should route to /subcategories/new' do
      expect(:get => '/subcategories/new').to be_routable
    end

    it 'routes /subcategories to subcategories controller' do
      expect(get('subcategories/new')).to route_to('subcategories#new')
    end
  end

  context 'for create action' do
    it 'should route to /subcategories' do
      expect(:post => '/subcategories').to be_routable
    end

    it 'routes /subcategories to subcategories controller' do
      expect(post('subcategories')).to route_to('subcategories#create')
    end
  end

  context 'for edit action' do
    it 'should route to /subcategories/:id' do
      expect(:get => "/subcategories/:id/edit").to be_routable
    end

    it 'routes /subcategories/:id/edit to subcategories controller' do
      expect(get("/subcategories/:id/edit")).to route_to(
                                                 :controller => "subcategories",
                                                 :action => "edit",
                                                 :id => ":id"
                                             )
    end
  end

  context 'for update action' do
    it 'should route to /subcategories/:id' do
      expect(:patch => '/subcategories/1').to be_routable
    end

    it 'routes /subcategories to subcategories controller' do
      expect(patch('subcategories/:id')).to route_to(
                                             :controller => "subcategories",
                                             :action => "update",
                                             :id => ":id"
                                         )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/subcategories/:id").to be_routable
    end

    it 'routes /subcategories to subcategories controller' do
      expect(delete('subcategories/:id')).to route_to(
                                              :controller => "subcategories",
                                              :action => "destroy",
                                              :id => ":id"
                                          )
    end
  end

end