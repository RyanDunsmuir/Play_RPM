Rails.application.routes.draw do
  # get 'users/create'
  # get 'users/authentication'
  # get 'order_songs/create'
  # get 'order_songs/destroy'
  # get 'orders/create'
  # get 'orders/show'
  # get 'orders/update'
  # get 'orders/destroy'
  # get 'songs/index'
  # get 'songs/show'
  # get 'songs/new'
  # get 'songs/create'
  # get 'songs/destroy'
  # get 'songs/edit'
  # get 'songs/update'

  resources :songs
  resources :orders, only: %i[create show update destroy] do
    resources :order_songs, only: %i[create]
  end
  resources :order_songs, only: %i[destroy]
  devise_for :users
  root to: 'pages#home'

  get '/mysongs' => 'pages#mysongs', :as => :user_songs_path
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
