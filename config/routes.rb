Rails.application.routes.draw do
  devise_for :users
  root 'inventories#index'
  resources :users, only: [:edit, :update]
  resources :items, only: [:new, :create, :edit, :update, :destroy]
end
