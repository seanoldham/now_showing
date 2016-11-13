class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    finish_watching(@item)
    respond_to do |format|
      if @item.save
        format.html { redirect_to root_path, notice:  "#{@item.name} was successfully added." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { redirect_to root_path }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        finish_watching(@item)
        format.html { redirect_back fallback_location: root_path, notice: "#{@item.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { redirect_to root_path }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    Tmdb::Api.key(ENV['TMDB_KEY'])
    search = params[:search]
    @search_term = search
    if search != ''
      @results = Tmdb::Movie.find(search)
    else
      flash[:alert] = 'You must enter a search term.'
      redirect_to root_path
    end
  end

  def landing
    @watching = Item.watching
  end

  def watched
    @items = Item.watched
  end

  def to_watch
    @items = Item.to_watch
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :image_url, :uniqueid, :status)
    end

    def finish_watching(item)
      if item.status == 2
        FinishWatchingJob.set(wait: 3.hours).perform_later(item.id)
      end
    end
end
