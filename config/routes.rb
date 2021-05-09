Rails.application.routes.draw do
  devise_for :users
  root to: "product#index"
  resources :product do
    resources :buyers, only: [:index, :create]
  end
end