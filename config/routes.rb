Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'
  resources :tasks do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
end
