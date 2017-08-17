Rails.application.routes.draw do
  root "users#new"
  post "users" => "users#create"

  get 'messages' => 'messages#index'
  post 'messages' => 'messages#create'
end
