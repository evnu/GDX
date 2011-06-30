GridFS::Application.routes.draw do
  root :to => "home#index"

  devise_for :admins
  devise_for :users

  resources :uploads
  resources :register_users
  resources :users
end
