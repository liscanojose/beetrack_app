class Location < ApplicationRecord
  belongs_to :vehicle
  validates :latitude, :longitude, :sent_at, :vehicle_identifier, presence: true

  def long_and_lat
    [self.latitude,self.longitude,self.vehicle_identifier]
  end

  def self.assign_new_location_to_vehicle(location)
    VehicleLocationsWorker.perform_in(1.second, location)
  end

end
