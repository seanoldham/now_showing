Rails.application.routes.draw do
  root 'home#index'

  post '/search', to: 'home#search'
  get '/search', to: redirect('/')
  post '/trello_add', to: 'home#trello_add'
  get '/trello_add', to: redirect('/')
end
