class Couple < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :swipes
   has_many :events, dependent: :destroy
   has_many :messages
   has_attachments :photos, maximum: 5
   has_many :couple_badges
   has_many :badges, through: :couple_badges

  def profile_pict
    if self.photos.first.blank?
      default_pict = "default-avatar_mszz7e.png"
    else
      self.photos.first.public_id
    end
  end
end
