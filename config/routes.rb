Rails.application.routes.draw do
  devise_for :users
  root to: "product#index"
  resources :product, only: [:new, :create, :show, :edit, :update]
end
