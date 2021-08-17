require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  # assert true
  # end
  
  test 'booking is valid with valid attributes' do
    today = Date.today
    user = users(:fulano)
    booking = Booking.new(
     user: user, 
      day: today.day,
      hour: Time.now.hour,
      week: today.cweek,
      month: today.month,
      year: today.year
    )
    assert booking.valid?
  end
end
