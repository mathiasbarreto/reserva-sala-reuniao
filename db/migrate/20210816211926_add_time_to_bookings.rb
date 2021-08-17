class AddTimeToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :hour, :integer
    add_column :bookings, :day, :integer
    add_column :bookings, :week, :integer
    add_column :bookings, :month, :integer
    add_column :bookings, :year, :integer
  end
end
