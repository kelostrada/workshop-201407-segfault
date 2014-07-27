Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions' => 'sessions#create'

  get 'home/index'

  resources :questions

  root 'home#index'
end
