class Airport < ApplicationRecord
  has_many :schedules, class_name: "Schedule", foreign_key: :departing_airport_id
  has_many :arrivals, class_name: "Arrival", foreign_key: :arriving_airport_id

  has_many :departing_flights, through: :schedules
  has_many :arriving_flights, through: :arrivals
end
