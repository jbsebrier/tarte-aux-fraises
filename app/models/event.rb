class Event < ActiveRecord::Base
  belongs_to :couple
  belongs_to :theme
  has_many :swipes
  has_many :messages

  after_create :add_master_badge

  def add_master_badge
    if couple.events.count == 5
      couple.badges << Badge.find_by(name: "Maitresse de Maison")
    end
  end
end
