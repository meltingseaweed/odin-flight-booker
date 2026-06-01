class Flight < ApplicationRecord
  has_many :schedules, class_name: "Schedule", foreign_key: :departing_flights_id
  has_many :arrivals, class_name: "Arrival", foreign_key: :arriving_flights_id

  has_many :departing_airports, through: :schedules
  has_many :arriving_airports, through: :arrivals

  has_many :bookings
end
