Rails.application.routes.draw do
  resources :items
  root 'items#landing'

  post '/search', to: 'items#search'
  get '/search', to: redirect('/')
end
