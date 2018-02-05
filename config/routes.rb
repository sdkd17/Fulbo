Rails.application.routes.draw do

  get 'courts/new'

  get 'courts/create'

  get 'courts/destroy'

  root 'static_pages#home'
  get 'sessions/new'

  get 'anotados/index'

  get 'anotados/create'
 
  get 'anotados/new'
 
  get 'anotados/show'

  get 'partidos/index'

  get 'partidos/show'

  get 'partidos/new'

  get 'partidos/create'

  post 'anotados/aceptar'
  post 'anotados/quitar'

  get 'static_pages/home'

  get '/signup',  to: 'users#new'
  
  get '/login',   to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  get 'logout',   to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :partidos
  resources :anotados
  resources :relationships,  only: [:create, :destroy]
  resources :locals
  resources :courts, only: [:new, :create, :destroy]
end
