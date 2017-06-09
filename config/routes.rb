Rails.application.routes.draw do
  get 'users/new'

  get 'users/show'

  get "/help", to: "static_pages#help"
  get "/signup", to: "users#new"
  root "static_pages#home"
  get  '/signup',  to: 'users#new'
  resources :users
end
