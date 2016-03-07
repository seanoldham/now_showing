class HomeController < ApplicationController
  def index
    @board = Trello::Board.find(ENV['BOARD_ID'])
    @movie_list = Trello::List.find(ENV['TO_WATCH_LIST_ID'])
    @movie_cards = @movie_list.cards
  end

  def search
    Tmdb::Api.key(ENV['TMDB_KEY'])
    search = params[:search]
    @search_term = search
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

  def trello
    if params[:button_id] == "currently_watching"
      Trello::Card.create(name: params[:result_title], list_id: ENV['WATCHING_LIST_ID'])
    else
      Trello::Card.create(name: params[:button_id], list_id: ENV['WATCHING_LIST_ID'])
    end
    # @add_to_watching =
    # @add_to_watched =
  end
end
