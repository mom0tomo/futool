Rails.application.routes.draw do
  root 'tops#index'

  resources :tops, only: [:index]
  resources :contents, only: [:index]
  resources :users, only: [:new, :create]

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]
end
