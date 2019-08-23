class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    @gardens = policy_scope(Garden).order(created_at: :desc)

    @geogardens = Garden.geocoded #returns flats with coordinates

    @markers = @geogardens.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { garden: garden }),
        image_url: helpers.asset_url('Group.png'),
        id: garden.id
      }
    end

  end

  def new
    @garden = Garden.new
    authorize @garden
  end

  def show
    @review = Review.new
    @booking = Booking.new

    @markers = [
      {
        lat: @garden.latitude,
        lng: @garden.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { garden: @garden })
      }
    ]
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    authorize @garden
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def update
    @garden.update(garden_params)
    authorize @garden
  end

  def edit
    authorize @garden
  end

  def destroy
    authorize @garden
    @garden.destroy
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
    authorize @garden
  end

  def garden_params
    params.require(:garden).permit(:name, :location, :price_per_day, :description, :purpose, :size, :photo, :user_id)
  end
end
