class AddInfosToCouples < ActiveRecord::Migration
  def change
    add_column    :couples, :gender_member_1, :string
    add_column    :couples, :gender_member_2, :string
    add_column    :couples, :age_member_1, :string
    add_column    :couples, :age_member_2, :string
    add_column    :couples, :about_couple, :string
    add_column    :couples, :couple_city, :string
    rename_column :couples, :picture, :couple_picture
    rename_column :couples, :nickname, :couple_nickname
    rename_column :couples, :rating, :couple_rating
  end
end

