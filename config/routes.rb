Rails.application.routes.draw do
  root "dashboard#index"
  resources :users, only: [:new, :edit]
  get "auth/github/callback", to: "sessions#create"
end
