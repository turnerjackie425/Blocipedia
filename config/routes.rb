Rails.application.routes.draw do
  devise_for :users

  resources :wikis

  resources :charges
  
  get 'welcome/index'

  get 'welcome/about' 

  get 'charges/create'

  root to: 'welcome#index'
end
