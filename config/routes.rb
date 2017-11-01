Rails.application.routes.draw do
  resources :words
  root "words#index"

  resources :dictionaries
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
