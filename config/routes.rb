Blacksquareapp::Application.routes.draw do
  resources :orders


  resources :products


  resources :orders
  resources :products
end
