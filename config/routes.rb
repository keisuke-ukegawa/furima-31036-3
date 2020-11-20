Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :edit, :show, :destroy]
  get 'item/:id', to: 'item#price'
  resources :purchase_record, only: [:index]
  resources :users, only: [:edit, :update]
end
