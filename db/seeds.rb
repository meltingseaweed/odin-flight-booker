# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#   Reset Database, destroy all airports and flights:
if Airport.exists?
  Airport.destroy_all
end
if Airport.exists?
  Flight.destroy_all
end

bru = Airport.create!(code: 'BRU', city: 'Brussels')
akj = Airport.create!(code: 'AKJ', city: 'Asahikawa')
hel = Airport.create!(code: 'HEL', city: 'Helsinki')
cdg = Airport.create!(code: 'CDG', city: 'Paris (Charles de Gaulle)')
dub = Airport.create!(code: 'DUB', city: 'Dublin')
airports = [ bru, akj, hel, cdg, dub ]

f1 = Flight.create!(
  departure_airport: hel.code,
  arrival_airport: bru.code,
  start: DateTime.new(2026, 6, 1, 10, 0, 0),
  duration: 155
)

f2 = Flight.create!(
  departure_airport: bru.code,
  arrival_airport: hel.code,
  start: DateTime.new(2026, 6, 1, 15, 0, 0),
  duration: 155
)


f3 = Flight.create!(
departure_airport: cdg.code,
arrival_airport: akj.code,
start: DateTime.new(2025, 6, 18, 13, 30, 0),
duration: 800
)

f4 = Flight.create!(
departure_airport: akj.code,
arrival_airport: cdg.code,
start: DateTime.new(2025, 6, 7, 13, 30, 0),
duration: 800
)

f5 = Flight.create!(
departure_airport: bru.code,
arrival_airport: dub.code,
start: DateTime.new(2025, 6, 7, 13, 30, 0),
duration: 95
)

f6 = Flight.create!(
departure_airport: dub.code,
arrival_airport: bru.code,
start: DateTime.new(2025, 6, 7, 13, 30, 0),
duration: 95
)

f7 = Flight.create!(
  departure_airport: hel.code,
  arrival_airport: bru.code,
  start: DateTime.new(2026, 6, 1, 15, 0, 0),
  duration: 155
)

f8 = Flight.create!(
  departure_airport: bru.code,
  arrival_airport: hel.code,
  start: DateTime.new(2026, 6, 1, 10, 0, 0),
  duration: 155
)

f9 = Flight.create!(
  departure_airport: akj.code,
  arrival_airport: bru.code,
  start: DateTime.new(2026, 7, 20, 10, 0, 0),
  duration: 700
)

bru.schedules.create!(departing_flights: f2)
bru.schedules.create!(departing_flights: f5)
bru.schedules.create!(departing_flights: f8)
bru.arrivals.create!(arriving_flights: f1)
bru.arrivals.create!(arriving_flights: f6)
bru.arrivals.create!(arriving_flights: f7)
bru.arrivals.create!(arriving_flights: f9)
akj.schedules.create!(departing_flights: f9)
