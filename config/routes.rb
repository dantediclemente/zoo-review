Rails.application.routes.draw do
  devise_for :users
  root to: "zoos#index"

  resources :zoos do
    collection do
      get 'search'
    end
  end 
end
