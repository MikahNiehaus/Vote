Rails.application.routes.draw do

  root "welcome#home"
  get '/signin' , to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/sessions', to: "sessions#destroy"

  resources :votes
  resources :users
  resources :topics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end