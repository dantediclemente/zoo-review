Rails.application.routes.draw do
  devise_for :users
  root to: "zoos#index"

  namespace :api do
    resources :zoos, only: [:index] do
      resources :reviews, only: [:show]
    end
  end

  resources :zoos do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end
end
