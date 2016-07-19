class AddAboutToCouples < ActiveRecord::Migration
  def change
    add_column :couples, :about_member1, :string
    add_column :couples, :about_member2, :string
  end
end
