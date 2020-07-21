Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      get '/dashboard', to: 'dashboards#index', as: 'dashboard'

      resources :favorites, path: 'my_list', only: [:index, :create]
      delete '/my_list/:type;:id', to: 'favorites#destroy'

      resources :series, only: :show

      resources :searches, path: 'search', only: :index

      resources :recomendations, only: :index

      resources :reviews, only: [:index, :create]  

      resources :movies, only: :show do
        member do
          get '/executions', to: 'executions#show'
          put '/executions', to: 'executions#update'
        end
      end 
    end
  end
  root to: 'home#index'
end
