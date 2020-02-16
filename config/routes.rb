Rails.application.routes.draw do
  resources :order_details
  resources :orders
  resources :reviews
  resources :tags
  resources :products
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
