Rails.application.routes.draw do
  devise_for :users
  root to: "maps#index"
  resources :users, onry: [:edit, :update]
  resources :maps, onry: [:new, :create, :show, :destroy] do
    resources :messages, onry: [:index, :create]
  end
end
