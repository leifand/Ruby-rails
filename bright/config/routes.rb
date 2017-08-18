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
  # Comment Routes
  #post 'comments' => 'comments#create'
end
