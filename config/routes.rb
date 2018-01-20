Rails.application.routes.draw do

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

  resources :users
  resources :partidos
  resources :anotados
  
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
