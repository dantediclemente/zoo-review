Rails.application.routes.draw do
  devise_for :users
  root to: "zoo#index"
end
