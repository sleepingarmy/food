class DropBakset < ActiveRecord::Migration
  def change
  	drop_table :baksets
  end
end
