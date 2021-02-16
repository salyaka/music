Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  resources :scores
  resources :logs, only: [:create, :destroy]
end
