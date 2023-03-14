class DashboardController < ApplicationController

  def index
    @users = Users.all
  end

  def show
    @user = current_user
    @messages = @user.bookings.messages
  end

  def dashboard
    @user = current_user
    @packages = @user.packages
    @bookings = @user.bookings
    @musicians = @user.musicians
  end
end
