class Swipe < ActiveRecord::Base
  belongs_to :event
  belongs_to :couple

  after_create :add_epicure_badge, :add_hungry_badge


  def add_epicure_badge
    if couple.swipes.count == 50
      couple.badges << Badge.find_by(name: "Touche a tout")
    end
  end

  def add_hungry_badge
    if couple.swipes.where("organizing_couple_swipe_result IS TRUE OR guest_couple_swipe_result IS TRUE").count >= 20
        couple.badges << Badge.find_by(name: "Gourmand")
    end
  end

end

