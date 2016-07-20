class AddSwipeResultToSwipes < ActiveRecord::Migration
  def change
    add_column :swipes, :organizing_couple_swipe_result, :boolean
    add_column :swipes, :guest_couple_swipe_result, :boolean
  end
end
