Rails.application.routes.draw do
  # Application Routes
  root 'application#index'
  # User Routes
  resources :users, exclude: [:index]
  # Session Routes
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # Event Routes
  resources :ideas
  post 'ideas/:id/user' => 'ideas#create'
  delete 'ideas/:id/user' => 'ideas#destroy'
  # Like Routes
  #get 'ideas/:id' => 'likes#create'
  get 'likes/:id' => 'likes#create'
end
