class PagesController < ApplicationController
  def home
  end

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end
end
