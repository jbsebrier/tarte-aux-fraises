class Event < ActiveRecord::Base
  belongs_to :couple
  belongs_to :theme
  has_many :swipes
  has_many :messages
end
