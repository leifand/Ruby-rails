Rails.application.routes.draw do
  root 'displays#index'
  get 'surveys/result' => 'displays#result'
  post 'survey' => 'displays#process_survey'
end
