Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end
  root "static_pages#home"
  resources :scores
  resources :logs, only: [:create, :destroy, :index]
end
