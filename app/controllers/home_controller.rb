class HomeController < ApplicationController
  def index

  end

  def trello_add
    if params[:button_name] == 'watching'
      Trello::Card.create(name: params[:result_title], list_id: ENV['WATCHING_LIST_ID'], desc: "#{params[:result_id]}\n#{params[:poster_path]}")
      flash[:alert] = "#{params[:result_title]} added to Currently Watching!"
      redirect_to root_path
    elsif params[:button_name] == 'to_watch'
      Trello::Card.create(name: params[:result_title], list_id: ENV['TO_WATCH_LIST_ID'], desc: "#{params[:result_id]}\n#{params[:poster_path]}")
      flash[:alert] = "#{params[:result_title]} added to Watch Later!"
      redirect_to root_path
    elsif params[:button_name] == 'watched'
      Trello::Card.create(name: params[:result_title], list_id: ENV['WATCHED_LIST_ID'], desc: "#{params[:result_id]}\n#{params[:poster_path]}")
      flash[:alert] = "#{params[:result_title]} added to Already Watched!"
      redirect_to root_path
    else
      flash[:alert] = "#{params[:result_title]} could not be added, please try again and tell Sean you broke his app."
    end
  end

  def trello_move
    if params[:button_name] == 'watching'
      current_card = Trello::Card.find(params[:id])
      current_card.move_to_list(ENV['WATCHING_LIST_ID'])
      flash[:alert] = "#{params[:result_title]} moved to Currently Watching!"
      redirect_to root_path
    elsif params[:button_name] == 'to_watch'
      current_card = Trello::Card.find(params[:id])
      current_card.move_to_list(ENV['TO_WATCH_LIST_ID'])
      flash[:alert] = "#{params[:result_title]} moved to Watch Later!"
      redirect_to root_path
    elsif params[:button_name] == 'watched'
      current_card = Trello::Card.find(params[:id])
      current_card.move_to_list(ENV['WATCHED_LIST_ID'])
      flash[:alert] = "#{params[:result_title]} moved to Already Watched!"
      redirect_to root_path
    else
      flash[:alert] = "#{params[:result_title]} could not be added, please try again and tell Sean you broke his app."
    end
  end
end
