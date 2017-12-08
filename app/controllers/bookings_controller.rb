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

    booking = Booking.new(start_booking: start_booking, end_booking: end_booking,
      user_id: current_user.id, flat_id: flat.id, status: "Pending",
      price_booking: nb_nights * price)
raise
    if booking.save
      redirect_to mybookings_path
    else
      render flat_path(flat)
    end
  end

  def edit
    @flat = @booking.flat
  end

  def update
    b_p = booking_params

    flat = Flat.find(params["flat_id"])
    price = flat.price.to_i

    start_booking = Time.new(b_p["start_booking(1i)"].to_i, b_p["start_booking(2i)"].to_i, b_p["start_booking(3i)"].to_i)
    end_booking = Time.new(b_p["end_booking(1i)"].to_i, b_p["end_booking(2i)"].to_i, b_p["end_booking(3i)"].to_i)
    nb_nights = ((end_booking - start_booking) / (60 * 60 * 24)).to_i

    @booking.update(start_booking: start_booking, end_booking: end_booking,
      price_booking: nb_nights * price, nb_night: nb_nights)

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
    params.require(:booking).permit(:start_booking, :end_booking, :price_booking, :nb_night)
  end


end
