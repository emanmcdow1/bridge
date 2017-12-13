class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def edit
    @events = Event.all
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "User deleted"
    redirect_to page_path('events')
  end

  def create
    @event = Event.new(event_params)

    @event.save
    if @event.save
      flash[:success] = "Event Created"
      redirect_to @event
    else
      flash[:warning] = "Unable to create event"
      render :new
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :date, :background)
    end

end
