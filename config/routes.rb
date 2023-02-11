Rails.application.routes.draw do
  resources :pets
  devise_for :users
  root to: 'pets#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
