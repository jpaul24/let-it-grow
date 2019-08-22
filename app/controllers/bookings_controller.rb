class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  before_action :set_garden, only: [:new, :create]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(current_user.bookings)
  end

  def new
    @booking = Booking.new
    @garden = Garden.find(params[:garden_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.garden = @garden
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
    authorize @booking
  end

  def destroy
    @booking.destroy
    authorize @booking
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:garden_id, :start_date, :end_date)
  end

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
