Rails.application.routes.draw do
  get 'users/new'

  get 'sessions/new'

  root 'pages#home'

  resources :events, :sermons

  get 'pages/home'

  get 'pages/vision'

  get 'pages/contact'

  get 'pages/events'

  get 'pages/listen'

  get 'pages/edit'

  get    '/login',   to: 'sessions#new'

  post   '/login',   to: 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'

  get '/signup' => 'users#new'

  post '/users' => 'users#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
