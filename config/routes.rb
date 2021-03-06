Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes do
    resources :comments, only: [:create, :new, :save]
    resources :likes,only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resources :newest, only: :index
  resources :popular, only: :index
end
