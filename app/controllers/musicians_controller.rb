class MusiciansController < ApplicationController
  before_action :set_musician, only: [ :show ]

  def index
    # raise
    @filter = params["filter"]
    if @filter.present?
      @location = @filter["location"]
      @type_of_event = @filter["type_of_event"]
      @musicians = Musician.where(location: @location)
    else
      @musicians = Musician.all#
    end
  end

  def show
    @musician = Musician.find(params[:id])
    @booking = Booking.new
  end

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new(musician_params)
    @musician.user = current_user

    if @musician.save
      redirect_to root_path(@musician)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_musician
    @musician = Musician.find(params[:id])
  end

  def musician_params
    params.require(:musician).permit(:first_name, :last_name, :nickname, :location, :description, :type_of_event, :type_of_musician, :youtube_link, :spotify_link)
  end

end
