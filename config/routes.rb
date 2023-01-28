require_relative "../app/api/products/products_api"
include Products
Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  get 'products/new'
  post 'products/create'
  get 'products/edit'
  post 'products/update'
  delete 'products/destroy'
  mount Products::ProductsAPI => '/api/products'  


  resources :products  
  root 'products#index'  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end

