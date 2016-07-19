class AddNicknameToCouples < ActiveRecord::Migration
  def change
    add_column :couples, :nickname, :string
  end
end
