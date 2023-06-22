class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  # def index
  # end

  def show; end

  def new
    @tent = Tent.find(params[:tent_id])
    @booking = Booking.new
  end

  def create
    #@user = User.find(params[:user_id])
    #@user = current.user
    @tent = Tent.find(params[:tent_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.tent = @tent
    if @booking.save!
      redirect_to tent_path(@tent), notice: "The bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @booking.update!(booking_params)
    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to tents_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :tent_id, :start_date, :end_date, :total_price)
  end
end

# params.require(:booking).permit(:user_id, :tent_id, :start_date, :end_date, :total_price)
