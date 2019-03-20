# frozen_string_literal: true

# app/models/vehicle_manufacturer.rb
class VehicleManufacturer < ApplicationRecord
  has_many :vehicle_models, dependent: :destroy
end
