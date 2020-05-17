class VehicleLocationsWorker
  include Sidekiq::Worker
  sidekiq_options retry: 5

  def self.perform(location)
    vehicle = Vehicle.find_by(identifier: location.vehicle_identifier).present? ? Vehicle.find_by(identifier: location.vehicle_identifier) : Vehicle.create(identifier: location.vehicle_identifier)
    vehicle.locations.push(location)
  end
end
