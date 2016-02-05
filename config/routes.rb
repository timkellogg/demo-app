Rails.application.routes.draw do
  root to: "static_pages#home"

  devise_for :users
    
  get 'static_pages/home'
  
  resources :campaigns  
  resources :companies
  resources :clients
  
  resources :users, :only => [:show] do
    resources :clients
  end
  
  
  # Sync local campaigns with those in Close.io
  get 'sync' => 'campaigns#sync'
  
end