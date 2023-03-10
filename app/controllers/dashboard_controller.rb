class DashboardController < ApplicationController

  def index
    @users = Users.all
  end

  def dashboard
    @user = current_user
    @packages = @user.packages
    @bookings = @user.bookings
  end
end
