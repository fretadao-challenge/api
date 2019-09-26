Rails.application.routes.draw do
  resources :profiles

  get "/search", to: "search#search"
  get "/:id", to: "shortener/shortened_urls#show"
end
