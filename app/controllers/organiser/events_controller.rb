class Organiser::EventsController < ApplicationController


  def index
    @events = current_couple.events
  end

  def new
    @event = current_couple.events.new
  end

  def edit
    @event =current_couple.events.find(params[:id])
  end

  def create
    @event = current_couple.events.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def destroy
    raise
    @event = current_couple.events.find(params[:id])
    @event.destroy
    redirect_to organiser_events_path
  end

  # def accept_booking
  #   @booking = Booking.find(params[:id])
  #   @booking.booking_status = "accepted"
  #   @booking.save
  #   redirect_to user_path(current_user)
  # end

  # def decline_booking
  #   @booking = Booking.find(params[:id])
  #   @booking.booking_status = "declined"
  #   @booking.save
  #   redirect_to user_path(current_user)
  # end

  def update
    @event = current_couple.events.find(params[:id])

    if @event.update(event_params)
      flash[:notice] = 'Your event was updated succesfully'
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :description, :city,:max_n_guest_couples)
  end


end
