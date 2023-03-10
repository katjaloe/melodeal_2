class DashboardController < ApplicationController
  def dashboard
    @user = current_user
    @bookings = @user.bookings
  end
end
