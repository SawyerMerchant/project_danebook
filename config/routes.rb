Rails.application.routes.draw do

  root 'users#new'
  resources :users do
    resource  :profile
    resources :posts

  end

  namespace :posts do
    concern :commentable
  end

  resources :posts do
    resources :comments
  end

  resources :likes#, only: [:update, :delete]

  resource :session, :only => [:new, :create, :destroy]

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'

  get '/timeline' => 'static_pages#timeline'
  get '/friends' => 'static_pages#friends'
  get '/about' => 'static_pages#about'
  get '/about_edit' => 'static_pages#about_edit'
  get '/photos' => 'static_pages#photos'

end
