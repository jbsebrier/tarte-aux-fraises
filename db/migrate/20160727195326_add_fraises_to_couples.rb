class AddFraisesToCouples < ActiveRecord::Migration
  def change
    add_column :couples, :fraises, :integer, default: 3
  end
end
