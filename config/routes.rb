Rails.application.routes.draw do
  root to: 'pets#index'
  resources :pets do
    resources :features
    get :featurepost
  end
  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
