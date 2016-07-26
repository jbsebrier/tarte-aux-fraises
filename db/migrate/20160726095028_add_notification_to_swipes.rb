class AddNotificationToSwipes < ActiveRecord::Migration
  def change
    add_column :swipes, :notification_couple, :boolean, :default => false
    add_column :swipes, :notification_event, :boolean, :default => false
  end
end
