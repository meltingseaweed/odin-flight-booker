class FlightsController < ApplicationController
  def index
    @all_flights = Flight.all
    @all_airports = Airport.all
    @all_arrivals = Arrival.all
    @all_departures = Schedule.all

    @flight_dates_list = []
    @all_flights.each do |f|
      @flight_date = f.start
      @flight_dates_list << flight_date_formatted
    end
  end

  private

  def flight_date_formatted
    @flight_date.strftime("%m/%d/%Y")
  end
end
