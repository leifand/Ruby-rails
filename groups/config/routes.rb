Rails.application.routes.draw do
  # landing to user index
  root 'users#index'

  # session routes
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # thank you RoR!
  resources :users
  resources :groups

  # member routes
  post '/join/:id' => 'members#create'
  delete '/leave/:id' => 'members#destroy'
end
