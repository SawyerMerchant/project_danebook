Rails.application.routes.draw do

  root 'users#new'
  resources :users, :only => [:new, :create]
  resource :session, :only => [:new, :create, :destroy]

  get '/login' => 'session#new'
  get '/logout' => 'session#destroy'

  get '/timeline' => 'static_pages#timeline'
  get '/friends' => 'static_pages#friends'
  get '/about' => 'static_pages#about'
  get '/about_edit' => 'static_pages#about_edit'
  get '/photos' => 'static_pages#photos'

end
