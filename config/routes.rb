Rails.application.routes.draw do
  resources :items
  root 'home#index'

  post '/search', to: 'home#search'
  get '/search', to: redirect('/')
  post '/trello_add', to: 'home#trello_add'
  get '/trello_add', to: redirect('/')
  post '/trello_move', to: 'home#trello_move'
  get '/trello_move', to: redirect('/')
end
