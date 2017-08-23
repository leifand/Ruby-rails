Rails.application.routes.draw do
  # Application Routes
  root 'application#index'
  # User Routes
  resources :users, exclude: [:index]
  # Session Routes
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # Event Routes
  resources :shoes
  #post 'ideas/:id/user' => 'ideas#create'
  #delete 'ideas/:id/user' => 'ideas#destroy'
  # Like Routes
  get 'dashboard/:id' => 'shoes#dashboard'
  get 'sales/:id' => 'sales#create'
end
