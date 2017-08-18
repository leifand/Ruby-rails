Rails.application.routes.draw do
  root 'sessions#index'
  post 'sessions' => 'sessions#create'

  resources :users
  
end
