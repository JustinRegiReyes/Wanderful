Rails.application.routes.draw do

   root to: "welcome#index"

  get 'users/index'

  get 'users/show'

  get 'users/edit'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  get 'users/new'


end
