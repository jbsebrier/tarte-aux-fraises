class AddNamesToCouples < ActiveRecord::Migration
  def change
    add_column :couples, :member1_name, :string
    add_column :couples, :member2_name, :string
  end
end
