class BookingsController < ApplicationController  
  def index
    @bookings = policy_scope(Booking).where(week:Date.today.cweek)
    monday = Date.today.next_occurring(:monday).day - 7
    @days = (monday..(monday + 4)).to_a
    @bookings_hash = generate_bookings_hash(@bookings, @days)
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    today = Date.today
    @booking.month = today.month
    @booking.week = today.cweek
    @booking.year = today.year
    authorize @booking
    flash[:notice] = 'Reserva realizada com sucesso!' if @booking.save
    redirect_to bookings_path
  end
  
  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_details: params[:booking][:booking_details])
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private
    def booking_params
      params.require(:booking).permit(:hour, :day, :booking_details)
      
    end
    
    def generate_bookings_hash(bookings, days) #transformar bookings em formato semanal
      bookings_hash = days.each_with_object({}) do |day, hash|
        hash[day] = {}
      end
      bookings.each do |booking|
        bookings_hash[booking.day][booking.hour] = booking if bookings_hash[booking.day]
      end
      bookings_hash
    end
end