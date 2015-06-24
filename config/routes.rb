Rails.application.routes.draw do
  root "dashboard#index"

  get "auth/github/callback", to: "sessions#create"

  resources :users, only: [:new, :edit, :update]
  resources :matches, only: [:index]
  resources :user_matches, only: [:create]
end
