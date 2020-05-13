Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:edit, :update] do
    namespace :items do
      resources :searches, only: :index
    end
    resources :purchase_histories, only: :index
    resources :items, only: [:new, :create, :edit, :update, :destroy] do
      resources :item_inventories, only: [:edit, :update]
      resources :purchase_histories, only: [:new, :create]
    end
  end
end
