Rails.application.routes.draw do
  root 'home#index'

  post '/search', to: 'home#search'
  get '/search', to: redirect('/')
  post '/trello', to: 'home#trello'
  get '/trello', to: redirect('/')
end
