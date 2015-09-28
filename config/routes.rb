Rails.application.routes.draw do

  get 'users', to: "users#index"

   root to: "welcome#index"

  get 'users/index'

  get 'users/show'

  get 'users/edit'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  get 'users/new', to: "users#new"

  post "/users", to: "users#create"

  get "/users/:id/edit", to: "users#edit", as: "user"

  patch "/users/:id/edit", to: "users#update"

end
