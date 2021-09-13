Rails.application.routes.draw do
  devise_for :users
  root to: "maps#index"
  resources :users, onry: [:edit, :update]
  resources :maps, onry: [:new, :create] do
    resources :messages, onry: [:index, :create]
  end
end
