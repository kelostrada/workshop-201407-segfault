Rails.application.routes.draw do
  get 'home/index'

  get 'questions/last_questions'
  resources :questions

  root 'home#index'
end
