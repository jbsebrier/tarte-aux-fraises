class EventsController < ApplicationController


  def index
    @couple = Couple.find(params[:couple_id])
    @events = Event.where(:couple_id)
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
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_path(current_user)
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
    @event = Event.find(params[:id])
    @event.couple = @couple

    if @event.update(params[:event].permit(:couple_id, :date))
      flash[:notice] = 'Your event was updated succesfully'
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :description, :city,:max_n_guest_couples)
  end


end
