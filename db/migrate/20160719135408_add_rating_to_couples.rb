class AddRatingToCouples < ActiveRecord::Migration
  def change
    add_column :couples, :rating, :integer
  end
end
