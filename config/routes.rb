Rails.application.routes.draw do
  get 'likes/create'
  devise_for :users
  root to: 'tweets#index'

  resources :users, only: [:index, :show] 
  
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  post   '/like/:story_id' => 'likes#like',   as: 'like'
  delete '/like/:story_id' => 'likes#unlike', as: 'unlike'



end