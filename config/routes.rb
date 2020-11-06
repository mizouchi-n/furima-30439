Rails.application.routes.draw do
  devise_for :users  
  root to: 'items#index'
  
  resources :items do
    resources :purchases
  end

  resources :users,only: [:index, :new, :create ]
 
  resources :orders
end
