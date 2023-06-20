Rails.application.routes.draw do
  get '/cart/add/:product_id', to: 'cart#add', as: 'add_to_cart'
  get '/cart/remove/:product_id', to: 'cart#remove', as: 'remove_from_cart'
  put '/cart/update/:product_id', to: 'cart#update', as: 'update_cart_item'
  get '/cart', to: 'cart#show', as: 'cart'

  resources :orders
  resources :products

  root "products#index"
end
