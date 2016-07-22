class Message < ActiveRecord::Base
  belongs_to :event
  belongs_to :couple
end
