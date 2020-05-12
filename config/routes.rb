Rails.application.routes.draw do

  root "welcome#home"
  get '/signin' , to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/sessions', to: "sessions#destroy"
  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create'

  resources :votes
  resources :users
  resources :topics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end