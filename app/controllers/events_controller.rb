class EventsController < ApplicationController



  def index
    available_event_list

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


  def available_event_list
    @events_available = Event.where("date > ?", Date.today)
    @events_available_not_organized_by_current_couple = @events_available.select { |event| event.couple != current_couple }

    @events_already_swiped_by_current_couple = []
    current_couple.swipes.each do |swipe|
      unless swipe.guest_couple_swipe == true
        @events_already_swiped_by_current_couple << swipe.event
      end
    end

    @events_for_display = @events_available_not_organized_by_current_couple - @events_already_swiped_by_current_couple
  end




end
