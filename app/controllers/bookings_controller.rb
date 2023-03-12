class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @package = Package.find(params[:package_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @package = Package.find(params[:package_id])
    @booking.package = @package
    @booking.status = 0

    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: 1)
    redirect_to musicians_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: 2)
    redirect_to musicians_path
  end

  def completed
    @booking = Booking.find(params[:id])
    @booking.update(status: 3)
    redirect_to musicians_path
  end

  def show_chat
    @booking = Booking.find(params[:id])
    @message = Message.new
  end

  private

  def booking_params
    params.require(:booking).permit(:location, :date, :time)
  end
end
