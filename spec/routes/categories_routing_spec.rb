require "rails_helper"

RSpec.describe 'routes for categories', :type => :routing do

  context 'for index action' do
    it 'should route to /categories/index' do
      expect(:get => "/categories/index").to be_routable
    end

    it 'routes /categories to categories controller' do
      expect(get('//categories/index')).to route_to('categories#index')
    end
  end

  context 'for new action' do
    it 'should route to /categories/new' do
      expect(:get => '/categories/new').to be_routable
    end

    it 'routes /categories to categories controller' do
      expect(get('categories/new')).to route_to('categories#new')
    end
  end

  context 'for create action' do
    it 'should route to /categories/create' do
      expect(:post => 'categories/create').to be_routable
    end

    it 'routes /categories to categories controller' do
      expect(post('categories')).to route_to('categories#create')
    end
  end

  context 'for edit action' do
    it 'should route to /categories/:id' do
      expect(:get => "/categories/:id/edit").to be_routable
    end

    it 'routes /categories/:id/edit to categories controller' do
      expect(get("/categories/:id/edit")).to route_to(
                                            :controller => "categories",
                                            :action => "edit",
                                            :id => ":id"
                                        )
    end
  end

  context 'for update action' do
    it 'should route to /categories/:id' do
      expect(:patch => '/categories/1').to be_routable
    end

    it 'routes /categories to categories controller' do
      expect(patch('categories/:id')).to route_to(
                                        :controller => "categories",
                                        :action => "update",
                                        :id => ":id"
                                    )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/categories/:id").to be_routable
    end

    it 'routes /categories to categories controller' do
      expect(delete('categories/:id')).to route_to(
                                         :controller => "categories",
                                         :action => "destroy",
                                         :id => ":id"
                                     )
    end
  end

end