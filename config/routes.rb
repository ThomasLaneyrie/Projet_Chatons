Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root to: "items#index"
  devise_for :users
  resources :items

  get 'carts/:id', to: 'carts#show', as: 'panier'

  get 'line_carts/show'
  post 'line_carts/create' => "line_carts#create"
  get 'line_carts/:id/add' => "line_carts#add_quantity", as: "line_cart_add"
  get 'line_carts/:id/reduce' => "line_carts#reduce_quantity", as: "line_cart_reduce"

  #Navbar 
  get '/contact', to: 'static#contact'
  get '/Home', to: 'items#contactindex'
end
