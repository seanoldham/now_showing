class HomeController < ApplicationController
  def index
    @board = Trello::Board.find(ENV['BOARD_ID'])
    movie_list = Trello::List.find(ENV['MOVIES_LIST_ID'])
    @movie_cards = movie_list.cards
  end

  def search
    Tmdb::Api.key(ENV['TMDB_KEY'])
    search = params[:search]
    @type = params[:media_type]
    if search != ""
      if @type == "movie"
        @results = Tmdb::Movie.find(search)
      elsif @type == "tv"
        @results = Tmdb::TV.find(search)
      else
        flash[:alert] = "You must choose Movie or TV."
        redirect_to root_path
      end
    else
      flash[:alert] = "You must enter a search term."
      redirect_to root_path
    end
  end
end
