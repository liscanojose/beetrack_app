class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.timestamp :sent_at
      t.string :vehicle_identifier
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
