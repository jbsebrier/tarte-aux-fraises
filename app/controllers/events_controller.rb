class EventsController < ApplicationController



  def index


  end

  def new
    @event = current_couple.events.new
  end

  def create
    @event = current_couple.events.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
    @event = Event.find(params[:id])
  end

end
