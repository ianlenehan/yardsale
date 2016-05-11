Rails.application.routes.draw do
  root :to =>'items#index'
  get '/favourites/delete' => 'favourites#delete'

  resources :items
  resources :users
  resources :favourites

  post '/verify' => 'users#verify'
  post '/updatelocation' => 'users#locate'
  get '/session/:phone' => 'session#create'
  delete '/items' => 'session#destroy', :as => 'logout'

end
