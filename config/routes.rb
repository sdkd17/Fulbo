Rails.application.routes.draw do

  root 'static_pages#home'
  
  get 'static_pages/home'

  get 'courts/new'
  get 'courts/create'
  get 'courts/destroy'
  
  get 'sessions/new'

  get 'anotados/index'
  get 'anotados/create'
  get 'anotados/new'
  get 'anotados/show'
  post 'anotados/aceptar'
  post 'anotados/quitar'

  get 'partidos/index'
  get 'partidos/show'
  get 'partidos/new'
  get 'partidos/create'

  get '/signup',  to: 'users#new'  
  get '/login',   to: 'sessions#new'
  get 'logout',   to: 'sessions#destroy'
  post  '/login', to: 'sessions#create'
  # get 'locals/canchas' to: 'locals#canchas'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :partidos do
    member do
      get :armar
    end
  end
  resources :anotados
  resources :relationships,  only: [:create, :destroy]
  
  resources :locals do
    member do
      get :canchas
    end
  end
  resources :courts, only: [:new, :create, :destroy]
end
