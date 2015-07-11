class CreateBaksets < ActiveRecord::Migration
  def change
    create_table :baksets do |t|
      t.string :type
      t.belongs_to :user
      t.integer :time_frame
      t.text :instructions
      t.timestamps null: false
    end
  end
end


