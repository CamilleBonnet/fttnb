class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :destroy, :update, :accept, :decline, :cancel]

  def index
  end

  def create
    b_p = booking_params
    start_booking = Time.new(b_p["start_booking(1i)"].to_i, b_p["start_booking(2i)"].to_i, b_p["start_booking(3i)"].to_i)
    end_booking = Time.new(b_p["end_booking(1i)"].to_i, b_p["end_booking(2i)"].to_i, b_p["end_booking(3i)"].to_i)
    nb_nights = ((end_booking - start_booking) / (60 * 60 * 24)).to_i

    flat = Flat.find(params["flat_id"])
    price = flat.price.to_i
    # price = price.to_i
    booking = Booking.new(start_booking: start_booking.to_s, end_booking: end_booking.to_s,
      user_id: current_user.id, flat_id: flat.id, status: "Pending",
      price_booking: nb_nights * price)
    if booking.save
      redirect_to mybookings_path
    else
      render flat_path(flat)
    end
  end

  def edit
    @flat = @booking.flat
    @booking.start_booking = Time.new(@booking.start_booking)
    @booking.end_booking = Time.new(@booking.end_booking)
  end

  def update
    @booking.update(booking_params)
    redirect_to mybookings_path
  end

  def destroy
    @booking.destroy
    redirect_to mybookings_path
  end

  def accept
    @booking.update(status: "Accepted")
    redirect_to mybookings_path
  end

  def decline
    @booking.update(status: "Declined")
    redirect_to mybookings_path
  end

  def cancel
    @booking.update(status: "Cancelled")
    redirect_to mybookings_path

  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_booking, :end_booking, :price_booking)
  end


end
