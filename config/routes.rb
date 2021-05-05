Rails.application.routes.draw do
  resources :products
  get 'dashboard' => 'products#dashboard'
  
  get 'new_error_product' => 'products#new_error'
  post 'new_error_product' => 'products#new_error'
 
  get 'products/index'
  root 'products#index'
end
