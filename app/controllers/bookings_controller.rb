class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @musician = Musician.find(params[:musician_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @musician = Musician.find(params[:musician_id])
    @booking.musician = @musician
    @booking.status = 0

    if @booking.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept

    @booking = Booking.find(params[:id])
    @booking.update(status: 1)
    redirect_to profile_path
  end

  def decline

    @booking = Booking.find(params[:id])
    @booking.update(status: 2)
    redirect_to profile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:location, :date, :time)
  end
end
