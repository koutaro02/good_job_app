Rails.application.routes.draw do
  devise_for :users
  root to: "maps#index"
  resources :users, onry: [:edit, :update]
  resources :maps, onry: [:new, :create]
end
