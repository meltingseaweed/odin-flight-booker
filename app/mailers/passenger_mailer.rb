class PassengerMailer < ApplicationMailer
  def confirm_booking
    @booking = params[:booking]
    @all_passengers = @booking.passengers
    @destination = @booking.flight.arrival_airport

    @all_passengers.each do |p|
      @passenger_name = p.name
      mail(to: p.email, subject: "Your booking has been confirmed")
    end
  end
end
