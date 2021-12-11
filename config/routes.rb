Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  resources :users, only: [:show, :edit, :update] do
    member do
      get :likes
    end
  end
  
  resources :comments, only: [:create, :destroy]
  resources :posts, only: [:show, :new, :create]
  resources :favorites, only: [:create, :destroy]
end
