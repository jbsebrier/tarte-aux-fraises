class SwipesController < ApplicationController



  def create
  end


  def update
  end

  def set_swipe
    @event = Event.find(params[:event_id])
    @organiser_couple = @event.couple
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
    check_match(@current_swipe)
    if @current_swipe.match
      check_participation(@current_swipe)
    end
    redirect_to organiser_event_couples_path(@event)
  end

  def organiser_swipe_left
    set_swipe
    @current_swipe = swipe_exists?(set_swipe)
    @current_swipe.organizing_couple_swipe = true
    @current_swipe.organizing_couple_swipe_result = false
    @current_swipe.save
    check_match(@current_swipe)
    if @current_swipe.match
      check_participation(@current_swipe)
    end
    redirect_to organiser_event_couples_path(@event)
  end

  def guest_swipe_right
    set_swipe
    @current_swipe = swipe_exists?(set_swipe)
    @current_swipe.guest_couple_swipe = true
    @current_swipe.guest_couple_swipe_result = true
    @current_swipe.save
    check_match(@current_swipe)
    if @current_swipe.match
      check_participation(@current_swipe)
    end
    redirect_to events_path
  end

  def guest_swipe_left
  set_swipe
    @current_swipe = swipe_exists?(set_swipe)
    @current_swipe.guest_couple_swipe = true
    @current_swipe.guest_couple_swipe_result = false
    @current_swipe.save
    check_match(@current_swipe)
    if @current_swipe.match
      check_participation(@current_swipe)
    end
    redirect_to events_path
  end

  def check_match(swipe)
    if (swipe.organizing_couple_swipe_result == true) && (swipe.guest_couple_swipe_result == true)
      swipe.match = true
      swipe.match_time =  Time.now
    else
      swipe.match = false
    end
    swipe.save
  end

  def check_participation(swipe)
    @current_nb_of_guests = swipe.event.swipes.where(participation: true).count
    if (swipe.event.max_n_guest_couples - @current_nb_of_guests) > 0
      swipe.participation = true
      swipe.save
    end
  end

end
