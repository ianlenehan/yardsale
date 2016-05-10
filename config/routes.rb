Rails.application.routes.draw do

  get '/items/reset' => 'items#reset_km'
  get '/favourites/delete' => 'favourites#delete'

  root :to =>'items#index'
  resources :items
  resources :users
  resources :favourites

  post '/verify' => 'users#verify'
  post '/updatelocation' => 'users#locate'
  get '/session/:phone' => 'session#create'
  delete '/items' => 'session#destroy', :as => 'logout'

end
