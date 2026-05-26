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
  { code: 'VIE', city: 'Vienna' },
  { code: 'BRU', city: 'Brussels' },
  { code: 'CPH', city: 'Copenhagen' },
  { code: 'AKJ', city: 'Asahikawa' },
  { code: 'HEL', city: 'Helsinki' },
  { code: 'CDG', city: 'Paris (Charles de Gaulle)' },
  { code: 'OSL', city: 'Oslo' },
  { code: 'ATH', city: 'Athens' },
  { code: 'DUB', city: 'Dublin' }
]

airports.each do |airport|
  Airport.create!(code: airport[:code], city: airport[:city])
end

vie = Airport.find_by(code: 'VIE')
bru = Airport.find_by(code: 'BRU')
cph = Airport.find_by(code: 'CPH')
akj = Airport.find_by(code: 'AKJ')
hel = Airport.find_by(code: 'HEL')
cdg = Airport.find_by(code: 'CDG')
osl = Airport.find_by(code: 'OSL')
ath = Airport.find_by(code: 'ATH')
dub = Airport.find_by(code: 'DUB')

# vie.Flight.create!(
#   departure_airport: vie,
#   arrival_airport: bru,
#   start: DateTime.new(2026, 6, 1, 10, 0, 0),
#   duration: 105 # In minutes
# )

# Flight.create!(
# departure_airport: cdg,
# arrival_airport: akj,
# start: DateTime.new(2025, 6, 7, 13, 30, 0),
# duration: 800
# )

# Flight.create!(
#   departure_airport: cph,
#   arrival_airport: dub,
#   start: DateTime.new(2026, 6, 3, 10, 15, 0),
#   duration: 140
# )
# Flight.create!(
#   departure_airport: ath,
#   arrival_airport: hel,
#   start: DateTime.new(2026, 6, 1, 13, 0, 0),
#   duration: 105 # In minutes
# )

# Flight.create!(
#   departure_airport: bru,
#   arrival_airport: osl,
#   start: DateTime.new(2026, 6, 4, 11, 30, 0),
#   duration: 800
# )

# Flight.create!(
#   departure_airport: dub,
#   arrival_airport: akj,
#   start: DateTime.new(2026, 6, 2, 8, 15, 0),
#   duration: 840
# )
