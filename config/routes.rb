Rails.application.routes.draw do
  # rutas collection
  # get, post/index
  get 'posts/new'
  post 'posts', to: 'posts#create' #las posts envian datos
  
  #rutas member
  
  get 'posts/:id', to: 'posts#show'
  get 'posts/:id/edit', to: 'posts#edit', as: 'edit_post'
  patch 'posts/:id', to: 'posts#update', as: 'post'
  delete 'posts/:id', to: 'posts#destroy', as: 'destroy_post'

  root to: 'posts#index'
end
