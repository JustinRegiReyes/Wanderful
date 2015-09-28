Rails.application.routes.draw do

   root to: "welcome#index"

   get 'users', to: "users#index"

   get '/users/new', to: "users#new", as: "sign_up"

   post "/users", to: "users#create"

   get "/users/:id", to: "users#show", as: "profile"

   get 'users/index'

   get 'users/show'

   get 'users/edit'

   get 'users/create'

   get 'users/update'

   get 'users/destroy'



      #sessions routes
   get "/sessions/new", to: "sessions#new", as: "login"

   post "/sessions", to: "sessions#create"

  get "/users/:id/edit", to: "users#edit", as: "user"

  patch "/users/:id/edit", to: "users#update"

end
