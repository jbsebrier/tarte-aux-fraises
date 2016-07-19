class CreateSwipes < ActiveRecord::Migration
  def change
    create_table :swipes do |t|
      t.references :event, index: true, foreign_key: true
      t.references :couple, index: true, foreign_key: true
      t.boolean :organizing_couple_swipe
      t.boolean :guest_couple_swipe
      t.boolean :match
      t.datetime :match_time
      t.boolean :participation

      t.timestamps null: false
    end
  end
end
