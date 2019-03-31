Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # categories
  resources :categories
  delete 'categories/:id/ajax', to: 'categories#destroy_ajax', as: :destroy_ajax_category

  # subcategories
  resources :subcategories
  delete 'subcategories/:id/ajax', to: 'subcategories#destroy_ajax', as: :destroy_ajax_subcategory

  # sessions
  root 'sessions#new'
  get  'login',  to: 'sessions#new',     as:'login'
  post 'login',  to: 'sessions#create',  as: :create_session
  get  'logout', to: 'sessions#destroy', as:'logout'

  # users
  post 'users/activate', to: 'users#activate', as: :activate_user
  delete 'users/:id', to: 'users#destroy', as: :destroy_user
  resources :users
  get '/profile', to: 'users#profile', as: :profile
  get '/profile/edit', to: 'users#edit_profile', as: :edit_profile
  patch '/update_profile', to: 'users#update_profile', as: :update_profile
  get '/edit_password/:reset_digest/edit', to: 'email_resets#edit_password', as: :edit_password
  patch '/update_password', to: 'email_resets#update_password', as: :update_password
  get '/edit_password_profile', to: 'users#edit_password', as: :edit_password_profile

  # Password reset
  resources :email_resets, only: [:new, :create, :edit, :update]

  # projects
  resources :projects do
    member do
      get 'reports', to: 'projects#reports', as: :project_reports
      get 'project_expenses', to: 'expenses#project_expenses', as: :project_expenses
    end
    resources :user_projects, except: :destroy
    # blogs
    resources :blogs, except: :destroy do
      # job progresses
      resources :job_progresses, except: :new
      get  'jobs/:job_id/job_progresses/new',  to: 'job_progresses#new', as: :new_job_progresses
      # expenses
      resources :expenses do
        get :autocomplete_supplier_name, :on => :collection
        member do
          get 'edit_image_info/:attachment_id', to: 'expenses#edit_image_info', as: :edit_expense_image_info
          patch 'update_image_info/:attachment_id', to: 'expenses#update_image_info', as: :update_expense_image_info
          delete 'delete_image_attachment/:attachment_id', to: 'expenses#delete_image_attachment', as: :delete_expense_image_attachment
        end
      end

      member do
        get 'edit_image_info/:attachment_id', to: 'blogs#edit_image_info', as: :edit_image_info
        patch 'update_image_info/:attachment_id', to: 'blogs#update_image_info', as: :update_image_info
        delete 'delete_image_attachment/:attachment_id', to: 'blogs#delete_image_attachment', as: :delete_image_attachment
      end
    end

    # concepts
    resources :concepts, except: :destroy do
      # jobs
      resources :jobs
    end

    #delete for concepts
    delete 'concepts/:id', to: 'concepts#destroy', as: :destroy_concept
    delete 'concepts/:id/ajax', to: 'concepts#destroy_ajax', as: :destroy_ajax_concept
    #blog
    delete 'blogs/:id', to: 'blogs#destroy', as: :destroy_blog
    delete 'blogs/:id/ajax', to: 'blogs#destroy_ajax', as: :destroy_ajax_blog
    post 'blogs/activate', to: 'blogs#activate', as: :activate_blog
    #users in project
    delete 'user_projects/:id', to: 'user_projects#destroy', as: :destroy_user_project
    post 'user_projects/new', to: 'user_projects#create', as: :create_user_projects
  end

  #ajax routes for expenses in blogs
  delete 'expenses/:id/ajax', to: 'expenses#destroy_ajax', as: :destroy_ajax_expense
  post 'expenses/activate', to: 'expenses#activate', as: :activate_expense
  post 'expensesticket/activate', to: 'expenses#activate_ticket', as: :activate_expense_ticket

  #ajax routes for job progresses in blogs
  post 'job_progresses/activate', to: 'job_progresses#activate', as: :activate_job_progresses

  # roles
  resources :roles

  # roleprivileges
  get  '/roleprivileges/:idRole/new',  to: 'roleprivileges#new', as: :new_roleprivileges
  post '/roleprivileges/:idRole/new',  to: 'roleprivileges#create', as: :create_roleprivileges
  delete '/role/:idRole/privilege/:idPrivilege',  to: 'roleprivileges#destroy', as: :delete_roleprivileges

  # errors
  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all
  match '*path' => redirect('/404'), via: :get
end
