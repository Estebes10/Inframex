Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'categories/index'
  post 'categories/create'
  get 'categories/new', as: :new_category
  get 'categories/:id/edit', to: 'categories#edit', as: :edit_category
  put 'categories/:id', to: 'categories#update', as: :update_category
  delete 'categories/:id', to: 'categories#destroy', as: :destroy_category

  # categories
  resources :categories

  get 'subcategories/index'
  post 'subcategories/create'
  get 'subcategories/new', as: :new_subcategory
  get 'subcategories/:id/edit', to: 'subcategories#edit', as: :edit_subcategory
  put 'subcategories/:id', to: 'subcategories#update', as: :update_subcategory
  delete 'subcategories/:id', to: 'subcategories#destroy', as: :destroy_subcategory

  # subcategories
  resources :subcategories

  get 'expenses/index'
  post 'expenses/create'
  get 'expenses/new', as: :new_expense

  # expenses
  resources :expenses
end
