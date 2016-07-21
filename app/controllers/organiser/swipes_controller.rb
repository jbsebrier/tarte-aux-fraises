class Organiser::SwipesController < ApplicationController


 def set_swipe
    @event = Event.find(params[:event_id])
    @organizing_couple = @event.couple
    @participating_couple = Couple.find(params[:couple_id])
    Swipe.new(couple: @participating_couple, event: @event)
  end

  def swipe_exists?(tested_swipe)
    @event_swipes = Swipe.all.select { |swipe| swipe.event == tested_swipe.event }
    @event_couple_swipe = @event_swipes.select { |swipe| swipe.couple == tested_swipe.couple}

    if @event_couple_swipe.length == 0
      tested_swipe
    else
      @event_couple_swipe[0]
    end

  end

  def organiser_swipe_right
    set_swipe
    @current_swipe = swipe_exists?(set_swipe)
    @current_swipe.organizing_couple_swipe = true
    @current_swipe.organizing_couple_swipe_result = true
    @current_swipe.save
    redirect_to organiser_event_couples_path(@event)
  end

  def organiser_swipe_left
    set_swipe
    @current_swipe = swipe_exists?(set_swipe)
    @current_swipe.organizing_couple_swipe = true
    @current_swipe.organizing_couple_swipe_result = false
    @current_swipe.save
    redirect_to organiser_event_couples_path(@event)
  end



end
