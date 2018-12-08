require "rails_helper"

RSpec.describe 'routes for blogs', :type => :routing do

  context 'for index action' do
    it 'should route to /blogs' do
      expect(:get => "/blogs").to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(get('/blogs')).to route_to('blogs#index')
    end
  end

  context 'for new action' do
    it 'should route to /blogs/new' do
      expect(:get => '/blogs/new').to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(get('blogs/new')).to route_to('blogs#new')
    end
  end

  context 'for create action' do
    it 'should route to /blogs' do
      expect(:post => '/blogs').to be_routable
    end

    it 'routes /blogs to blogs controller' do
      expect(post('blogs')).to route_to('blogs#create')
    end
  end

end
