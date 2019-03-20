# frozen_string_literal: true

# app/controllers/vehicles_controller.rb
class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show update destroy]
  before_action :set_location, only: %i[index]

  # GET /vehicles
  def index
    @vehicles = Vehicle.by_distance(origin: @location)#.limit(30)

    render json: @vehicles
  end

  # GET /vehicles/1
  def show
    render json: @vehicle
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      render json: @vehicle, status: :created, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def vehicle_params
    params.require(:vehicle).permit(:vehicle_model_id, :user_id, :mileage_id)
  end

  def location_params
    params.permit(:latitude, :longitude)
  end

  def set_location
    @location = location_params.values.map(&:to_f)
  end
end
