Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"
  post 'home/add-amount', to: "home#add_amount", as: "add_amount"

  resources :your_stocks
  resources :transactions

end
