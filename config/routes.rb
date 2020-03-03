Rails.application.routes.draw do

  root 'plants#index'

  resources :comments, only: [:index, :show, :new, :create, :edit, :update]
  resources :plants, only: [:index, :show, :new, :create, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:index, :show, :new, :create, :edit, :update]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resource :cart, only: [:show] do
    put 'add/:plant_id', to: 'carts#add', as: :add_to
    put 'remove/:plant_id', to: 'carts#remove', as: :remove_from
  end

end
