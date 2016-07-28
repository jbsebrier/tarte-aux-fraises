class AddImagePathToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :image_path, :string
  end
end
