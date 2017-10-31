Rails.application.routes.draw do
  get '/' => 'questions#index'

  resources :questions

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  root 'questions#index'
end
