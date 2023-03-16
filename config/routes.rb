Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root to: "items#index"
  devise_for :users
  resources :items, param: "title"
  get 'carts/:id', to: 'carts#show', as: 'panier'
  resources :carts, only: [:show] do
    scope '/checkout' do
      post 'create', to: 'checkout#create', as: 'checkout_create'    
      get 'success', to: 'checkout#success', as: 'checkout_success'
      get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'  
    end
  end

  resources :orders, only: [:create, :index, :show]
  resources :line_carts, only: [:create, :destroy]
  get 'line_carts/:id/add' => "line_carts#add_quantity", as: "line_cart_add"
  get 'line_carts/:id/reduce' => "line_carts#reduce_quantity", as: "line_cart_reduce"

  # Navbar 
  resources :users
  get '/contact', to: 'static#contact'
  get '/Home', to: 'items#contactindex'

  
end
