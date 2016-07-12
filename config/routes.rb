Rails.application.routes.draw do
  devise_for :users
  root to: "zoos#index"

  resources :zoos do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end
end
