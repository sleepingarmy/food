class RolifyCreateDrivers < ActiveRecord::Migration
  def change
    create_table(:drivers) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_drivers, :id => false) do |t|
      t.references :user
      t.references :driver
    end

    add_index(:drivers, :name)
    add_index(:drivers, [ :name, :resource_type, :resource_id ])
    add_index(:users_drivers, [ :user_id, :driver_id ])
  end
end
