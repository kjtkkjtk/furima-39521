Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  
  resources :items do
    resources :orders, only: [:index, :create]
  end
  
  root to: "items#index"
end