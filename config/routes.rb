Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

    namespace :api do
    namespace :v1 do
      resources :challenges do
        resources :solutions do
          resources :comments
          resources :votes, only: [:create, :update, :destroy]
        end
        resources :tags, only: [:index, :create, :destroy]
      end
      
      resources :tags, only: [:index, :show]
    end
  end
end
