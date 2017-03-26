Rails.application.routes.draw do
  get 'reddits/index'

  get 'games/new'

  get 'games/show'

  get 'games/index'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts, only: [:create, :destroy, :show] do
    resources :comments
  end
  resources :relationships,       only: [:create, :destroy]
  resources :games
  resources :reddits, only: [:index]
end
