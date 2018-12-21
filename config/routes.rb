Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # categories
  resources :categories

  # subcategories
  resources :subcategories

  # expenses
  resources :expenses

  # concepts
  resources :concepts

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
  resources :blogs, except: :destroy do
    resources :jobs
  end
  delete 'blogs/:id', to: 'blogs#destroy', as: :destroy_blog
  delete 'blogs/:id/ajax', to: 'blogs#destroy_ajax', as: :destroy_ajax_blog
  post 'blogs/activate', to: 'blogs#activate', as: :activate_blog

  # suppliers
  resources :suppliers

  resources :projects

end
