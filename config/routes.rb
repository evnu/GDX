GridFS::Application.routes.draw do
  devise_for :admins

  root :to => "home#index"
  devise_for :users

  resources :uploads
end
