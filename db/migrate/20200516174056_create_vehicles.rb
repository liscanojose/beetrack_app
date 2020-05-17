class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :identifier
      t.string :brand

      t.timestamps
    end
  end
end
