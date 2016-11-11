Rails.application.routes.draw do
  resources :items
  root 'items#landing'

  post '/search', to: 'items#search'
  get '/search', to: redirect('/')
  get 'watched', to: 'items#watched'
  get 'to-watch', to: 'items#to_watch'
end
