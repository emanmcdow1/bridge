class SermonsController < ApplicationController
  def create
    @sermon = Sermon.new(sermon_params)
    @sermon.save
  end

  def index
    @sermons = Sermon.all
  end

  def edit
    @sermons = Sermon.all
    @sermon = Sermon.new
  end

  def new
    @sermon = Sermon.new
  end

  def listen
    @sermons = Sermon.order(:date)
  end

  def destroy
    @sermon = Sermon.find(params[:id])
    @sermon.destroy
    flash[:success] = "Sermon deleted"
    redirect_to page_path('listen')
  end

  private
    def sermon_params
      params.require(:sermon).permit(:audio, :title, :speaker, :date)
    end

end
