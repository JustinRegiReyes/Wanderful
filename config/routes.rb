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

   get 'cities/index', to: 'cities#index'

    get 'cities/:id', to: 'cities#show'

   get 'cities/new', to: 'cities#new'

   get 'cities/create', to: 'cities#create'

   get 'cities/edit'

   get 'cities/update'

   get 'cities/destroy'

   get 'cities/:id', to: 'cities#show'

   #sessions routes
   get "/sessions/new", to: "sessions#new", as: "login"

   post "/sessions", to: "sessions#create"

   delete "/sessions/destroy", to: "sessions#destroy", as: "logout"

   #users routes

   get "/users/:id/edit", to: "users#edit", as: "user"

   patch "/users/:id/edit", to: "users#update"

   #posts routes
   get "/logs", to: "logs#index"
   get "/logs/new", to: "logs#new"

   get "/logs/:id", to: "logs#show"

   post '/logs', to: 'logs#create'

end
