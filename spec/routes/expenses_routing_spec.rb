require "rails_helper"

RSpec.describe 'routes for expenses', :type => :routing do

  context 'for show action' do
    it 'should route to /projects/:project_id/blogs/:blog_id/expenses/:id' do
      expect(:get => '/projects/:project_id/blogs/:blog_id/expenses/:id').to be_routable
    end

    it 'routes /projects/:project_id/blogs/:blog_id/expenses/:id to expenses controller' do
      expect(get("/projects/:project_id/blogs/:blog_id/expenses/:id")).to route_to(
                                               :controller => "expenses",
                                               :action => "show",
                                               :id => ":id",
                                               :project_id => ":project_id",
                                               :blog_id => ":blog_id"
                                           )
    end
  end
  context 'for new action' do
    it 'should route to /projects/:project_id/blogs/:blog_id/expenses/new' do
      expect(:get => '/projects/:project_id/blogs/:blog_id/expenses/new').to be_routable
    end

    it 'routes /projects/:project_id/blogs/:blog_id/expenses to expenses controller' do
      expect(get('/projects/:project_id/blogs/:blog_id/expenses/new')).to route_to(
                                                                              :controller => "expenses",
                                                                              :action => "new",
                                                                              :project_id => ":project_id",
                                                                              :blog_id => ":blog_id"
                                                                          )
    end
  end

  context 'for create action' do
    it 'should route to /projects/:project_id/blogs/:blog_id/expenses' do
      expect(:post => '/projects/:project_id/blogs/:blog_id/expenses').to be_routable
    end

    it 'routes /projects/:project_id/blogs/:blog_id/expenses to expenses controller' do
      expect(post('/projects/:project_id/blogs/:blog_id/expenses')).to route_to(
                                                                           :controller => "expenses",
                                                                           :action => "create",
                                                                           :project_id => ":project_id",
                                                                           :blog_id => ":blog_id"
                                                                       )
    end
  end

  context 'for edit action' do
    it 'should route to /projects/:project_id/blogs/:blog_id/expenses/:id' do
      expect(:get => "/projects/:project_id/blogs/:blog_id/expenses/:id/edit").to be_routable
    end

    it 'routes /projects/:project_id/blogs/:blog_id/expenses/:id/edit to expenses controller' do
      expect(get("/projects/:project_id/blogs/:blog_id/expenses/:id/edit")).to route_to(
                                                    :controller => "expenses",
                                                    :action => "edit",
                                                    :id => ":id",
                                                    :project_id => ":project_id",
                                                    :blog_id => ":blog_id"
                                                )
    end
  end

  context 'for update action' do
    it 'should route to /projects/:project_id/blogs/:blog_id/expenses/:id' do
      expect(:patch => '/projects/:project_id/blogs/:blog_id/expenses/1').to be_routable
    end

    it 'routes /projects/:project_id/blogs/:blog_id/expenses to expenses controller' do
      expect(patch('/projects/:project_id/blogs/:blog_id/expenses/:id')).to route_to(
                                                :controller => "expenses",
                                                :action => "update",
                                                :id => ":id",
                                                :project_id => ":project_id",
                                                :blog_id => ":blog_id"
                                            )
    end
  end

  context 'for destroy action' do
    it 'should not to be routable' do
      expect(:delete => "/projects/:project_id/blogs/:blog_id/expenses/:id").to be_routable
    end

    it 'routes /projects/:project_id/blogs/:blog_id/expenses to expenses controller' do
      expect(delete('/projects/:project_id/blogs/:blog_id/expenses/:id')).to route_to(
                                                 :controller => "expenses",
                                                 :action => "destroy",
                                                 :id => ":id",
                                                 :project_id => ":project_id",
                                                 :blog_id => ":blog_id")
    end
  end

end