Rails.application.routes.draw do


  root :to =>'items#index'
  resources :items
  resources :users

  post '/verify' => 'users#verify'
  get '/session/:phone' => 'session#create'
  delete '/items' => 'session#destroy', :as => 'logout'

end
