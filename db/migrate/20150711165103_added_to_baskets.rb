class AddedToBaskets < ActiveRecord::Migration
  def change
  	add_column :baskets, :category, :string
  	add_column :baskets, :user_id, :integer
  	add_column :baskets, :time_frame, :integer
  	add_column :baskets, :instructions, :text
    add_column :baskets, :name, :string
  end
end
