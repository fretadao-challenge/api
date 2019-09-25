Rails.application.routes.draw do

  resources :profiles
  get '/search', to: 'search#search'

end
