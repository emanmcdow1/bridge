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

  private
    def sermon_params
      params.require(:sermon).permit(:audio, :title, :speaker, :date)
    end

end
