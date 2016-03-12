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
    if params[:button_name] == "currently_watching"
      Trello::Card.create(name: params[:result_title], list_id: ENV['WATCHING_LIST_ID'])
      flash[:alert] = "#{params[:result_title]} added to Currently Watching!"
      redirect_to root_path
    elsif params[:button_name] == "to_watch"
      Trello::Card.create(name: params[:result_title], list_id: ENV['TO_WATCH_LIST_ID'])
      flash[:alert] = "#{params[:result_title]} added to To Watch!"
      redirect_to root_path
    elsif params[:button_name] == "watched"
      Trello::Card.create(name: params[:result_title], list_id: ENV['WATCHED_LIST_ID'])
      flash[:alert] = "#{params[:result_title]} added to Watched!"
      redirect_to root_path
    else
      flash[:alert] = "#{params[:result_title]} could not be added, please try again and tell Sean you broke his app."
    end
  end
end
