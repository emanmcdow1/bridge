class PagesController < ApplicationController
  def home
    @events = Event.all
  end

  def vision
  end

  def contact
  end

  def events
    @events = Event.all
  end

  def edit
    @events = Event.all
    @event = Event.new
    @sermon = Sermon.new
    @sermons = Sermon.all
  end

  def listen
    @sermons = Sermon.all.sort {|s1,s2| s1.date <=> s2.date}
  end
end
