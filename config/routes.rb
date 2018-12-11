Rails.application.routes.draw do
  resources :blogs, only: %I[index new create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # sessions
  root 'sessions#new'
  get  'login',  to: 'sessions#new',     as:'login'
  post 'login',  to: 'sessions#create',  as: :create_session
  get  'logout', to: 'sessions#destroy', as:'logout'

  # users
  resources :users
end
