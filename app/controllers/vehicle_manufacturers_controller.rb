# frozen_string_literal: true

# controller/vehicle_manufacturers_controller.rb
class VehicleManufacturersController < ApplicationController
  before_action :set_vehicle_manufacturer, only: %i[show update destroy]

  # GET /vehicle_manufacturers
  def index
    @vehicle_manufacturers = VehicleManufacturer.all

    render json: @vehicle_manufacturers
  end

  # GET /vehicle_manufacturers/1
  def show
    render json: @vehicle_manufacturer
  end

  # POST /vehicle_manufacturers
  def create
    @vehicle_manufacturer = VehicleManufacturer.new(vehicle_manufacturer_params)

    if @vehicle_manufacturer.save
      render json: @vehicle_manufacturer, status: :created, location: @vehicle_manufacturer
    else
      render json: @vehicle_manufacturer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicle_manufacturers/1
  def update
    if @vehicle_manufacturer.update(vehicle_manufacturer_params)
      render json: @vehicle_manufacturer
    else
      render json: @vehicle_manufacturer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicle_manufacturers/1
  def destroy
    @vehicle_manufacturer.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle_manufacturer
    @vehicle_manufacturer = VehicleManufacturer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def vehicle_manufacturer_params
    params.require(:vehicle_manufacturer).permit(:name)
  end
end
