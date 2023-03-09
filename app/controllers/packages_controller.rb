class PackagesController < ApplicationController
  before_action :set_musician, only: [ :new, :create ]

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(package_params)
    @package.user = current_user
    @package.musician = @package

    if @package.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_musician
    @musician = Musician.find(params[:musician_id])
  end

  def package_params
    params.require(:package).permit(:price, :hours, :description)
  end
end
