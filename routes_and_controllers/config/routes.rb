Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users

  get 'users', to: 'users#index'
  post 'users', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'
  patch 'users/:id', to: 'users#update'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'

  
  resources :artworks, only: [:create, :show, :update, :update, :destroy]

  resources :artwork_shares, only: [:create, :destroy]

  # resources :users do
  #   resources :artworks, only: :index
  # end

  get 'users/:user_id/artworks', to: 'artworks#index'

  get 'users/:user_id/comments', to: 'comments#index'

  get 'artworks/:artwork_id/comments', to: 'comments#index'
end
