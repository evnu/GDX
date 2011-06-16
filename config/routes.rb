GridFS::Application.routes.draw do
  devise_for :users

  resources :uploads
end
