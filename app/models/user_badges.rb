class UserBadges < ActiveRecord::Base
  belongs_to :couple
  belongs_to :badge

end
