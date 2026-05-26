class Schedule < ApplicationRecord
  belongs_to :departing_airport, class_name: "Airport"
  belongs_to :departing_flights, class_name: "Flight"
end
