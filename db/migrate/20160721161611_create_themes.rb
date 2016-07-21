class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name

      t.timestamps null: false
    end

    add_reference(:events, :theme, foreign_key: true, index: true)

  end
end


