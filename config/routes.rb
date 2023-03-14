Rails.application.routes.draw do
  
  get 'line_cards/show'
  get 'carts/destroy'
  get 'carts/:id', to: 'carts#show', as: 'panier'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "items#index"
  devise_for :users
  resources :items
    
end
