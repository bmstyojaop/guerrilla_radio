Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'

  resources :users, only: [:index, :show] do
    member do
      get 'like'
    end
  end
  
  resources :tweets do
    resources :likes, only: [:create, :destroy] 
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end