# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times { |i| Vehicle.create(identifier: "HASD#{i}") }
y = 0
Vehicle.all.each do |vehicle|
  y+=1
  3.times { |i| vehicle.locations.push(Location.create(latitude: -33.116889 + y, longitude: -70.106705 + y, vehicle_identifier: vehicle.identifier, sent_at: Time.now - i.minutes ))}
end