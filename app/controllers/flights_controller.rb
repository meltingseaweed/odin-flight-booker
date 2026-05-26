class FlightsController < ApplicationController
  def index
    @all_flights = Flight.all
    @all_airports = Airport.all
    @all_arrivals = Arrival.all
    @all_departures = Schedule.all

    @flight_dates_list = []

    flight_date_formatted
    if params[:departure_airport].present?
      display_flights
    end
  end

  private

  def flight_date_formatted
      @all_flights.each do |f|
      @flight_date = f.start
      @flight_dates_list << @flight_date.strftime("%Y/%m/%d")
      @flight_dates_list.uniq!
    end
  end

  def queried_information
    @queried_information = {
      "departure_airport" => params[:departure_airport],
      "arrival_airport" => params[:arrival_airport],
      "passengers" => params[:passengers],
      "departure_date" => params[:departure_date]
    }
  end

  def display_flights
    @available_flights = Flight.where("departure_airport = ?", params[:departure_airport]).where("arrival_airport = ?", params[:arrival_airport]).to_a
    @on_the_date = Flight.where(departure_airport: params[:departure_airport]).where(arrival_airport: params[:arrival_airport]).where("start LIKE ?", Flight.sanitize_sql_like(params[:departure_date].tr("/", "-")) + "%").to_a
  end

  def check_query
    if params.has_key?(:departure_airport)
      @test = params[:departure_airport]
    end
  end
end
