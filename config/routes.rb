Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "users/new"
  get "users/show"
  get "/help", to: "static_pages#help"
  get "/signup", to: "users#new"
  root "static_pages#home"
  get  "/signup",  to: "users#new"

  resources :users
end
