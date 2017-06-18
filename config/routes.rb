Rails.application.routes.draw do



  get 'activities/show'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/help", to: "static_pages#help"
  get "/signup", to: "users#new"
  root "static_pages#home"
  get  "/signup",  to: "users#new"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :words , only: [:index]
  resources :categories
  resources :categories, only: [:index, :show] do
    resources :lessons, only: [:create]
  end
  resources :lessons, only: [:show, :update, :destroy]
end
