Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'categories/index', as: :category_index
  post 'categories/create'
  get 'categories/new', as: :new_category
  get 'categories/:id/edit', to: 'categories#edit', as: :edit_category
  put 'categories/:id', to: 'categories#update', as: :update_category
  delete 'categories/:id', to: 'categories#destroy', as: :destroy_category

  # categories
  resources :categories

  post 'subcategories/create'
  get 'subcategories/new', as: :new_subcategory
  get 'subcategories/:id/edit', to: 'subcategories#edit', as: :edit_subcategory
  put 'subcategories/:id', to: 'subcategories#update', as: :update_subcategory
  delete 'subcategories/:id', to: 'subcategories#destroy', as: :destroy_subcategory

  # subcategories
  resources :subcategories

  get 'expenses/index', as: :expense_index
  post 'expenses/create'
  get 'expenses/new', as: :new_expense
  get 'expenses/:id/edit', to: 'expenses#edit', as: :edit_expense
  put 'expenses/:id', to: 'expenses#update', as: :update_expense
  delete 'expenses/:id', to: 'expenses#destroy', as: :destroy_expense

  # expenses
  resources :expenses

  # sessions
  root 'sessions#new'
  get  'login',  to: 'sessions#new',     as:'login'
  post 'login',  to: 'sessions#create',  as: :create_session
  get  'logout', to: 'sessions#destroy', as:'logout'

  # users
  resources :users

  # suppliers
  resources :suppliers
  
end
