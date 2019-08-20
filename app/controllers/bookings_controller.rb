class BookingsController < ApplicationController

  before_action :set_garden, only: [:new, :edit]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def new
    @booking = Booking.new
    @garden = Garden.find(params[:garden_id])
    @user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.garden = @garden
    @booking.user = current_user

    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking.update(booking_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @booking.destroy
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
  end
end