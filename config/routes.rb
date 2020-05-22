Rails.application.routes.draw do

  # root "welcome#home"
  get '/signin' , to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/sessions', to: "sessions#destroy"
  root 'welcome#home'

  # get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'

  resources :votes
  resources :users do 
  get '/showvotes' , to: "sessions#vote_index" end
  resources :topics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end