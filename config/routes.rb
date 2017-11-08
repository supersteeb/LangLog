Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :dictionaries
    resources :words

    root to: "users#index"
  end


  # ...local.../tests/  
  resources :tests do 
    collection do 
      get 'create', to: 'tests#create', as:'create'
      get ':id', to: 'tests#show', as: 'show'
    end
  end

  devise_for :users
  resources :words

  root 'words#index'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
