GridFS::Application.routes.draw do
  match "/files/uploads/*path" => "gridfs#serve"
  resources :uploads
end
