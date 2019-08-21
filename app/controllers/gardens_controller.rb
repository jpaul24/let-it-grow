class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    @gardens = Garden.all
  end

  def new
    @garden = Garden.new
  end

  def show
    @review = Review.new
    @booking = Booking.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def update
    @garden.update(garden_params)
  end

  def edit
  end

  def destroy
    @garden.destroy
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name, :location, :price_per_day, :description, :purpose, :size, :photo, :user_id)
  end
end
