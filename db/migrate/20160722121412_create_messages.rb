class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :couple, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.datetime :date

      t.timestamps null: false
    end
  end
end
