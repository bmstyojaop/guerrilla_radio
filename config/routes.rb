Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
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

  post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end