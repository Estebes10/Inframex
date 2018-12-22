Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # categories
  resources :categories, except: :destroy do
    resources :categories
  end
  delete 'categories/:id', to: 'categories#destroy', as: :destroy_category

  # subcategories
  resources :subcategories, except: :destroy do
    resources :subcategories
  end
  delete 'subcategories/:id', to: 'subcategories#destroy', as: :destroy_subcategory

  # expenses
  resources :expenses, except: :destroy do
    resources :expenses
  end
  delete 'expenses/:id', to: 'expenses#destroy', as: :destroy_expense

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
      resources :jobs
    end
  end
  delete 'blogs/:id', to: 'blogs#destroy', as: :destroy_blog
  delete 'blogs/:id/ajax', to: 'blogs#destroy_ajax', as: :destroy_ajax_blog
  post 'blogs/activate', to: 'blogs#activate', as: :activate_blog

  # suppliers
  resources :suppliers

  #resources :projects

end
