Rails.application.routes.draw do
  get 'charges/create'

  devise_for :users

  resources :wikis

  resources :charges, only: [:new, :create]
  
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'
end
