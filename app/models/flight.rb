class Flight < ApplicationRecord
  has_many :schedules, foreign_key: :departing_flights_id

  has_many :departing_airports, through: :schedules
end
