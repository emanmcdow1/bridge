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
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "User deleted"
    redirect_to page_path('events')
  end
  private
    def sermon_params
      params.require(:sermon).permit(:audio, :title, :speaker, :date)
    end

end
