class DropBakset < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? "baksets"
      drop_table :baksets
    end
  end
end
