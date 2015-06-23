Rails.application.routes.draw do
  root "dashboard#index"
  resources :users, only: [:new]
  get "auth/github/callback", to: "sessions#create"
end
