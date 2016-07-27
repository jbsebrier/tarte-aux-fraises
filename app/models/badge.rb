class Badge < ActiveRecord::Base

  has_many :couple_badges, dependent: :destroy
  has_many :couples, through: :couple_badges
  has_attachment :icon
end

