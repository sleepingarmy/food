class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :apt_num
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps null: false
    end
  end
end

