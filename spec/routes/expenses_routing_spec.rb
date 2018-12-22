require "rails_helper"

RSpec.describe 'routes for expenses', :type => :routing do

  context 'for show action' do
    it 'should route to /expenses/:id' do
      expect(:get => '/expenses/:id').to be_routable
    end

    it 'routes /expenses/:id to expenses controller' do
      expect(get("/expenses/:id")).to route_to(
                                               :controller => "expenses",
                                               :action => "show",
                                               :id => ":id"
                                           )
    end
  end
  context 'for new action' do
    it 'should route to /expenses/new' do
      expect(:get => '/expenses/new').to be_routable
    end

    it 'routes /expenses to expenses controller' do
      expect(get('expenses/new')).to route_to('expenses#new')
    end
  end

  context 'for create action' do
    it 'should route to /expenses' do
      expect(:post => '/expenses').to be_routable
    end

    it 'routes /expenses to expenses controller' do
      expect(post('expenses')).to route_to('expenses#create')
    end
  end

  context 'for edit action' do
    it 'should route to /expenses/:id' do
      expect(:get => "/expenses/:id/edit").to be_routable
    end

    it 'routes /expenses/:id/edit to expenses controller' do
      expect(get("/expenses/:id/edit")).to route_to(
                                                    :controller => "expenses",
                                                    :action => "edit",
                                                    :id => ":id"
                                                )
    end
  end

  context 'for update action' do
    it 'should route to /expenses/:id' do
      expect(:patch => '/expenses/1').to be_routable
    end

    it 'routes /expenses to expenses controller' do
      expect(patch('expenses/:id')).to route_to(
                                                :controller => "expenses",
                                                :action => "update",
                                                :id => ":id"
                                            )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/expenses/:id").to be_routable
    end

    it 'routes /expenses to expenses controller' do
      expect(delete('expenses/:id')).to route_to(
                                                 :controller => "expenses",
                                                 :action => "destroy",
                                                 :id => ":id"
                                             )
    end
  end

end