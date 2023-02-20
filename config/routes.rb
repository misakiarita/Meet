Rails.application.routes.draw do

  root 'top#index'

  
  
  devise_for :users
  post 'guest_login', to: 'top#guest_login'
  post 'admin_guest_login', to: 'top#admin_guest_login'


  resources :users do
    member do
      get :favorite_pet
    end
  end
  
  namespace :admin do
    resources :users
  end

  resources :conversations do
    resources :messages
  end

  resources :pets do
    resources :features
    get :featurepost
  end

  resources :evaluations



  resources :favorites, only: [:create, :destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
