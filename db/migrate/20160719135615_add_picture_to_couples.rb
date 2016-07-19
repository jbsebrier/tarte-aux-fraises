class AddPictureToCouples < ActiveRecord::Migration
  def change
    add_column :couples, :picture, :string
  end
end
