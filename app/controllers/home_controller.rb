class HomeController < ApplicationController
  def index
    @board = Trello::Board.find(ENV['BOARD_ID'])
    movie_list = Trello::List.find(ENV['MOVIES_LIST_ID'])
    @movie_cards = movie_list.cards
  end

  def search
    @search = params[:search]
    @type = params[:media_type]
  end
end
