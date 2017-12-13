Rails.application.routes.draw do
  get 'users/new'

  get 'sessions/new'

  root 'pages#home'

  resources :events

  get 'pages/home'

  get 'pages/message'

  get 'pages/contact'

  get 'pages/events'

  get 'pages/listen'

  get    '/login',   to: 'sessions#new'

  post   '/login',   to: 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
