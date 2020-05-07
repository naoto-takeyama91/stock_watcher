Rails.application.routes.draw do
  devise_for :users
  root 'inventories#index'
end
