class PagesController < ApplicationController
  def home
    @events = Event.all
  end

  def message
  end

  def contact
  end

  def events
    @events = Event.all
  end

  def listen
  end
end
