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
  resources :users

  # suppliers
  resources :suppliers
  
end
