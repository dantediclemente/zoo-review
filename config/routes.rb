Rails.application.routes.draw do
  devise_for :users
  root to: "zoos#index"
  resources :zoos
end
