class MusiciansController < ApplicationController
  before_action :set_musician, only: [ :show ]

  def index
    @filter = params["filter"]
    if @filter.present?
      @location = @filter["location"]
      @type_of_event = @filter["type_of_event"]
      @musicians = Musician.where(location: @location)
    elsif params[:query].present?
      sql_query = "first_name ILIKE :query OR location ILIKE :query OR type_of_musician ILIKE :query"
      @musicians = Musician.where(sql_query, query: "%#{params[:query]}%")
    else
      @musicians = Musician.all
    end
  end

  def show
    @user = current_user
    @musician = Musician.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @reviews = Review.all
  end

  def new
    @musician = Musician.new
    @package = Package.new
  end

  def create
    @musician = Musician.new(musician_params)
    @musician.user = current_user

    if @musician.save
      redirect_to musician_path(@musician)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_musician
    @musician = Musician.find(params[:id])
  end

  def musician_params
    params.require(:musician).permit(:first_name, :last_name, :nickname, :location, :description, :type_of_musician, :youtube_link, :spotify_link, :soundcloud_link, :instagram_link, :photo)
  end

end
