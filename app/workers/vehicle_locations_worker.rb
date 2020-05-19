class VehicleLocationsWorker
  include Sidekiq::Worker
  sidekiq_options retry: 5

  #Worker encargado de hacer la logica de crear un vehiculo si no existia y luego setiarle su localización
  def perform(location_hash)
    vehicle = Vehicle.find_by(identifier: location_hash["vehicle_identifier"]).present? ? Vehicle.find_by(identifier: location_hash["vehicle_identifier"]) : Vehicle.create(identifier: location_hash["vehicle_identifier"])
    location = Location.new(latitude: location_hash["latitude"], longitude: location_hash["longitude"],sent_at: location_hash["sent_at"], vehicle_identifier: location_hash["vehicle_identifier"])
    vehicle.locations.push(location)
  end
end
