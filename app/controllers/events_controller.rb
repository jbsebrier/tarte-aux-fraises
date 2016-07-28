class EventsController < ApplicationController

  def index
    available_event_list
  end

  def my_events
    @my_events = Event.where(couple: current_couple).order(date: :desc)
    @participating_events = Event.joins(:swipes).where(swipes: { couple_id: current_couple.id, participation: true })
    @swipes_true = Swipe.where(event_id: params[:id], participation: true)
  end

  def notification_false
    the_event = Event.find_by(id: params[:event_id])
    if current_couple == the_event.couple
      swipes_true = Swipe.where(event_id: the_event, participation: true)
      swipes_true.each do |st|
        st.notification_event = false
        st.save
      end
    else
      swipe_participating_couple = Swipe.where(event_id: the_event, couple_id: current_couple, participation: true).first
      swipe_participating_couple.notification_couple = false
      swipe_participating_couple.save
    end

    redirect_to event_path(the_event)
  end

  def new
    @event = current_couple.events.new
  end

  def create
    @event = current_couple.events.new(event_params)
    if @event.save
       current_couple.fraises += 3
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
