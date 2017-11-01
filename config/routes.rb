Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :dictionaries
    resources :words

    root to: "users#index"
  end

  devise_for :users
  resources :words
  root "words#index"

  resources :dictionaries
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
