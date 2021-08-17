# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
    user = User.create!(name: Faker::Name.unique.name, 
              email: Faker::Internet.unique.email,
              password: '123123'
            )
    puts "created user #{user.name}"
end

counter = 0
until counter == 15
    time = Time.now + rand(1..120) * 60 * 60
    time = Time.now + rand(1..120) * 60 * 60 while time.hour < 6 || time.hour > 23
    booking = Booking.new( user: User.all.sample,
                  booking_details: Faker::Movie.quote,
                  hour: time.hour,
                  day: time.day,
                  week: Date.today.cweek,
                  month: time.month,
                  year: time.year
  )
  if booking.valid?
    booking.save
    counter += 1
    puts "created booking at #{booking.booking_details}"
  end
end
puts "#{Booking.count} bookings created"