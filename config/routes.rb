Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'

  resources :users, only: [:index, :show] do
    collection do 
      get 'favorites'
    end
  end
  
  resources :tweets do
    resources :comments, only: :create
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end