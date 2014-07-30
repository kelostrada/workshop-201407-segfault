Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :questions do
    resources :answers, shallow: true
  end


  root 'questions#index'
end
