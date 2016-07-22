class RenameUserBagdesToCoupleBadges < ActiveRecord::Migration
  def change
    rename_table :user_badges, :couple_badges
  end
end
