class BookingsController < ApplicationController
  def new
    # @flight = Flight.find(params[:flight_id])
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    if @booking = Booking.create!(booking_params)
      PassengerMailer.with(booking: @booking).confirm_booking.deliver_later
      redirect_to @booking, notice: "Your booking was successful"
    else
      render :new, status, unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end


  private
  def booking_params
    params.expect(booking: [ :flight_id, passengers_attributes: [ [ :name, :email ] ]  ])
  end
end
