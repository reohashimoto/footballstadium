Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'matches#index'
  resources :matches do
      resources :comments, only: :create
      collection do
        get 'search'
      end
      resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
  resources :newmatches, only: :index
end
