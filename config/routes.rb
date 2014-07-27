Rails.application.routes.draw do
  get 'home/index'

  resources :questions

  root 'home#index'
end
