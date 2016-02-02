Rails.application.routes.draw do
  root to: "static_pages#home"

  devise_for :users
    
  get 'static_pages/home'
  
  resources :campaigns
end