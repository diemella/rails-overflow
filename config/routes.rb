Rails.application.routes.draw do
  get '/' => 'questions#index'

  resources :questions

  root 'questions#index'
end
