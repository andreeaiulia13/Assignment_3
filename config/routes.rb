Rails.application.routes.draw do
  resources :products
  get 'dashboard' => 'products#dashboard'
  get 'products/index'
  root 'products#index'
end
