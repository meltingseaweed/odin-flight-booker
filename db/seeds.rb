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



airports = [
  { code: 'BRU', city: 'Brussels' },
  { code: 'AKJ', city: 'Asahikawa' },
  { code: 'HEL', city: 'Helsinki' },
  { code: 'CDG', city: 'Paris (Charles de Gaulle)' },
  { code: 'DUB', city: 'Dublin' }
]

airports.each do |airport|
  Airport.create!(code: airport[:code], city: airport[:city])
end

bru = Airport.find_by(code: 'BRU')
akj = Airport.find_by(code: 'AKJ')
hel = Airport.find_by(code: 'HEL')
cdg = Airport.find_by(code: 'CDG')
dub = Airport.find_by(code: 'DUB')


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

bru.schedules.create!(departing_flights: f2)
bru.schedules.create!(departing_flights: f5)
bru.arrivals.create!(arriving_flights: f1)
bru.arrivals.create!(arriving_flights: f6)
