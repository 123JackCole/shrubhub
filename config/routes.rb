Rails.application.routes.draw do

  root 'plants#index'

  resources :comments, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :plants, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :orders, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  patch '/cart', to: 'cart#update'

  resource :cart, only: [:show] do
    put 'add/:plant_id', to: 'carts#add', as: :add_to
    put 'remove/:plant_id', to: 'carts#remove', as: :remove_from
  end

end
