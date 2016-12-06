Rails.application.routes.draw do

  root 'static_pages#home'

  get '/timeline' => 'static_pages#timeline'
  get '/friends' => 'static_pages#friends'
  get '/about' => 'static_pages#about'
  get '/about_edit' => 'static_pages#about_edit'
  get '/photos' => 'static_pages#photos'

end
