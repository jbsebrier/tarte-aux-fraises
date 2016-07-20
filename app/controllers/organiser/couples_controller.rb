class Organiser::CouplesController < ApplicationController

before_action :set_event

  def index
    available_couples_list

  end



  def set_event
    @event = Event.find(params[:event_id])
  end


  def available_couples_list
    swipe_couple_ids = Swipe.where(event: @event, organizing_couple_swipe: true).pluck(:couple_id)
    @couples_for_display = Couple.where.not(id: swipe_couple_ids).where.not(id: current_couple.id)
  end


end
