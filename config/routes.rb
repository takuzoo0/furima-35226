Rails.application.routes.draw do
  devise_for :users
  root to: "product#index"
  resources :product
end
