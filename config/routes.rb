Rails.application.routes.draw do
  # rutas collection
  # get, post/index
  get 'posts/new', to: 'posts#new', as: 'posts'
  post 'posts', to: 'posts#create' #las posts envian datos

  #rutas member
  get 'posts/:id', to: 'posts#show', as: 'show_post'
  delete 'posts/:id', to: 'posts#destroy', as: 'destroy_post'

  root to: 'posts#index'
end
