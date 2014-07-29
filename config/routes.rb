Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :questions

  root 'questions#index'
end
