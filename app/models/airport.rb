class Airport < ApplicationRecord
  has_many :schedules, foreign_key: :departing_airport_id
  has_many :departing_flights, through: :schedules
end
