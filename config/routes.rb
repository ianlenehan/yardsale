Rails.application.routes.draw do
  root :to =>'items#index'
  get '/favourites/delete' => 'favourites#delete'
  get '/users/index' => 'users#index'
  get '/items/admin' => 'items#admin'
  get '/items/:id/close' => 'items#close', :as => 'close_item'
  get '/items/:id/open' => 'items#reopen', :as => 'open_item'

  resources :items
  resources :users
  resources :favourites

  post '/verify' => 'users#verify'
  post '/updatelocation' => 'users#locate'
  get '/session/:phone' => 'session#create'
  delete '/items' => 'session#destroy', :as => 'logout'

end
