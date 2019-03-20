# frozen_string_literal: true

# app/controllers/vehicle_models_controller.rb
class VehicleModelsController < ApplicationController
  before_action :set_vehicle_model, only: %i[show update destroy]

  # GET /vehicle_models
  def index
    @vehicle_models = VehicleModel.all

    render json: @vehicle_models
  end

  # GET /vehicle_models/1
  def show
    render json: @vehicle_model
  end

  # POST /vehicle_models
  def create
    @vehicle_model = VehicleModel.new(vehicle_model_params)

    if @vehicle_model.save
      render json: @vehicle_model, status: :created, location: @vehicle_model
    else
      render json: @vehicle_model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicle_models/1
  def update
    if @vehicle_model.update(vehicle_model_params)
      render json: @vehicle_model
    else
      render json: @vehicle_model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicle_models/1
  def destroy
    @vehicle_model.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle_model
    @vehicle_model = VehicleModel.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def vehicle_model_params
    params.require(:vehicle_model).permit(:vehicle_manufacturer_id, :name, :vehicle_type_id, :seats, :doors)
  end
end
