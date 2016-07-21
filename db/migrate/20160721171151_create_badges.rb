class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :icon
    end

    create_table :user_badges do |t|
      t.references :couple, foreign_key: true, index: true
      t.references :badge, foreign_key: true, index: true
    end
  end

end
