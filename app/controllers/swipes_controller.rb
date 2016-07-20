class SwipesController < ApplicationController



  def create
  end


  def update
  end

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


  def new
    set_swipe
    @current_swipe = swipe_exists?(set_swipe)
    @current_swipe.guest_couple_swipe = true
    @current_swipe.guest_couple_swipe_result = true
    @current_swipe.save
    # @current_swipe.boule
    redirect_to events_path
  end



  end

  def left_swipe
  end

  def right_swipe

  @swipe = set_swipe
  swipe_exists(@swipe)

    if current_couple == @event.couple
      # branching pour savoir si le couple qui swipe est organisateur ou participant

  end


end
