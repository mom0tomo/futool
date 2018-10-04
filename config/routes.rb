Rails.application.routes.draw do
  get 'tops/index'

  root 'tops#index'

  resources :tops, only: [:index]
  resources :contents, only: [:index]
end
