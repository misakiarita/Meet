Rails.application.routes.draw do

  root to: 'pets#index'
  
  devise_for :users
  resources :users do
    member do
        get :favorite_pet
    end
  end
  
  resources :conversations do
    resources :messages
  end

  resources :pets do
    resources :features
    patch :feature
    get :featurepost
  end

  resources :favorites, only: [:create, :destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
