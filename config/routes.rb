Rails.application.routes.draw do
  devise_for :users, controller:{ 
    confirmations: 'confirmations'
  }
  resources :users
    # Users
    # get "/users/user", to: "users#alluser", as: :all_user
    # get '/users/:id/edit', to: 'users#edit'
    # patch '/users/:id', to: 'users#update'

  resources :home, only: [:index]
  root to: "home#index"
  
  get '/tickets/user/:user_id', to: "tickets#from_author"
  get '/tickets', to: 'tickets#show'
  get '/tickets/admin!', to: 'tickets#admin', as: :admin
  get '/tickets/new', to: 'tickets#new', as: :new_tickets

  post '/tickets', to: 'tickets#create'
  get '/tickets/:id/edit', to: 'tickets#edit', as: :edit_ticket
  get '/tickets/:id/edit2', to: 'tickets#edit2'
  patch '/tickets/:id', to: 'tickets#update', as: :ticket
  patch '/tickets/:id', to: 'tickets#update2', as: :ticket2
  delete '/tickets/:id', to: 'tickets#delete'
  delete '/tickets/:id', to: 'tickets#delete2'

  post '/verify', to: 'tickets#verify', as: :verify


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
