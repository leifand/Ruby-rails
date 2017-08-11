Rails.application.routes.draw do
  root 'rpg#index'
  post 'process_gold' => 'rpg#process_gold'
end
