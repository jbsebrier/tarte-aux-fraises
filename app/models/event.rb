class Event < ActiveRecord::Base
  belongs_to :couple
  has_many :swipes
end
