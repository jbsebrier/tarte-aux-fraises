class EventsController < ApplicationController



  def index
    available_event_list
  end

  def my_events
    @my_events = Event.where(couple: current_couple)
    @participating_events = Event.joins(:swipes).where(swipes: { couple_id: current_couple.id, participation: true })
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
    @event = Event.find_by(id: params[:id])
    @message = Message.new()
    @swipes_true = Swipe.where(event_id: params[:id], participation: true)
  end


  def available_event_list
    swipe_event_ids = Swipe.where(couple: current_couple, guest_couple_swipe: true).pluck(:event_id).uniq
    @events_for_display = Event.where.not(id: swipe_event_ids, couple: current_couple).where("date > ?", Date.today)
 end




end
