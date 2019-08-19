class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(params[:garden])
    @garden.save
  end

  def update
    @garden = Garden.new(params[:garden])
    @garden.update(params[:garden])
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def destroy
    @garden = Garden.find(params[:id])
    @garden.destroy
  end
end
