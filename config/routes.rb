GridFS::Application.routes.draw do
  root :to => "home#index"
  get "tags/index"

  devise_for :admins
  devise_for :users

  resources :uploads
  resources :register_users

  match "/users/sign_up" => "register_users#new"

  resources :users, :only => [:show, :destroy]
end
