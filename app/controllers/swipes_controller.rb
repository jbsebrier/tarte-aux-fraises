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
    @event_swipes = Swipe.all.where(event: tested_swipe.event)
    @event_couple_swipe = @event_swipes.select { |swipe| swipe.couple == tested_swipe.couple}

    if @event_couple_swipe.length == 0
      tested_swipe
    else
      @event_couple_swipe[0]
    end

  end

  def organiser_swipe_right

    set_swipe
    respond_to do  |format|
      @current_swipe = swipe_exists?(set_swipe)
      @current_swipe.organizing_couple_swipe = true
      @current_swipe.organizing_couple_swipe_result = true
      @current_swipe.save
      # on check sil y a match
      check_match(@current_swipe)
      swipe_couple_ids = Swipe.where(event: @event, organizing_couple_swipe: true).pluck(:couple_id)
      @couples_for_display = Couple.where.not(id: swipe_couple_ids).where.not(id: current_couple.id)
      if @current_swipe.match
        check_participation(@current_swipe)
      end
      format.json {
        render json: { current_swipe: @current_swipe, couples: @couples_for_display}
      }
    end
  end

  def organiser_swipe_left
     set_swipe
    respond_to do  |format|
      @current_swipe = swipe_exists?(set_swipe)
      @current_swipe.organizing_couple_swipe = true
      @current_swipe.organizing_couple_swipe_result = false
      @current_swipe.save
      # on check sil y a match
      check_match(@current_swipe)
      swipe_couple_ids = Swipe.where(event: @event, organizing_couple_swipe: true).pluck(:couple_id)
      @couples_for_display = Couple.where.not(id: swipe_couple_ids).where.not(id: current_couple.id)
      format.json {
        render json: { current_swipe: @current_swipe, couples: @couples_for_display}
      }
    end
  end

  def guest_swipe_right
    set_swipe
    respond_to do  |format|
      @current_swipe = swipe_exists?(set_swipe)
      @current_swipe.guest_couple_swipe = true
      @current_swipe.guest_couple_swipe_result = true
      @current_swipe.save
      # on check sil y a match
      check_match(@current_swipe)
      swipe_event_ids = Swipe.where(couple: current_couple, guest_couple_swipe: true).pluck(:event_id).uniq
      @events_for_display = Event.where.not(id: swipe_event_ids, couple: current_couple).where("date > ?", Date.today)
      if @current_swipe.match
        check_participation(@current_swipe)
      end
      format.json {
        render json: { current_swipe: @current_swipe, events: @events_for_display}
      }
    end
  end

  def guest_swipe_left
    set_swipe
    respond_to do  |format|
      @current_swipe = swipe_exists?(set_swipe)
      @current_swipe.guest_couple_swipe = true
      @current_swipe.guest_couple_swipe_result = false
      @current_swipe.save
      check_match(@current_swipe)
      swipe_event_ids = Swipe.where(couple: current_couple, guest_couple_swipe: true).pluck(:event_id).uniq
      @events_for_display = Event.where.not(id: swipe_event_ids, couple: current_couple).where("date > ?", Date.today)
      format.json {
        render json: { current_swipe: @current_swipe, events: @events_for_display}
      }
    end
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
      swipe.notification_couple = true
      swipe.notification_event = true
      swipe.save
      # respond_to { |format| format.js} if swipe.participation
    end
  end

end
