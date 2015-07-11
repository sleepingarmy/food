class AddBasketIdToItem < ActiveRecord::Migration
  def change
  	add_column :items, :basket_id, :integer
  end
end
