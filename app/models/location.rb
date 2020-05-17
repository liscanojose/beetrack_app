class Location < ApplicationRecord
  belongs_to :vehicle
  validates :latitude, :longitude, :sent_at, :vehicle_identifier, presence: true

  def long_and_lat
    [self.latitude,self.longitude,self.vehicle_identifier]
  end

  def assign_new_location_to_vehicle
    VehicleLocationsWorker.perform(self)
  end

end
