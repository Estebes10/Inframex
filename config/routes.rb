Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # categories
  resources :categories
  delete 'categories/:id/ajax', to: 'categories#destroy_ajax', as: :destroy_ajax_category

  # subcategories
  resources :subcategories
  delete 'subcategories/:id/ajax', to: 'subcategories#destroy_ajax', as: :destroy_ajax_subcategory

  # expenses
  resources :expenses
  delete 'expenses/:id', to: 'expenses#destroy', as: :destroy_expense
  delete 'expenses/:id/ajax', to: 'expenses#destroy_ajax', as: :destroy_ajax_expense
  post 'expenses/activate', to: 'expenses#activate', as: :activate_expense
  post 'expensesticket/activate', to: 'expenses#activate_ticket', as: :activate_expense_ticket

  # concepts
  resources :concepts
  delete 'concepts/:id', to: 'concepts#destroy', as: :destroy_concept
  delete 'concepts/:id/ajax', to: 'concepts#destroy_ajax', as: :destroy_ajax_concept

  # sessions
  root 'sessions#new'
  get  'login',  to: 'sessions#new',     as:'login'
  post 'login',  to: 'sessions#create',  as: :create_session
  get  'logout', to: 'sessions#destroy', as:'logout'

  # users
  post 'users/activate', to: 'users#activate', as: :activate_user
  delete 'users/:id', to: 'users#destroy', as: :destroy_user
  resources :users

  # blogs
  resources :projects do
    resources :blogs, except: :destroy do
      resources :jobs, except: :new

      get  'jobs/new/:concept_id',  to: 'jobs#new', as: :new_job
      post 'jobs',  to: 'jobs#create', as: :create_job
    end

    delete 'blogs/:id', to: 'blogs#destroy', as: :destroy_blog
    delete 'blogs/:id/ajax', to: 'blogs#destroy_ajax', as: :destroy_ajax_blog
    post 'blogs/activate', to: 'blogs#activate', as: :activate_blog
  end

  # suppliers
  resources :suppliers

  #resources :projects

  # roles
  resources :roles

  # roleprivileges
  get  '/roleprivileges/:idRole/new',  to: 'roleprivileges#new', as: :new_roleprivileges
  post '/roleprivileges/:idRole/new',  to: 'roleprivileges#create', as: :create_roleprivileges
  delete '/role/:idRole/privilege/:idPrivilege',  to: 'roleprivileges#destroy', as: :delete_roleprivileges
end
