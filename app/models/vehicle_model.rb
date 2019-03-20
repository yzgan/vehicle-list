# frozen_string_literal: true

# app/models/vehicle_model.rb
class VehicleModel < ApplicationRecord
  belongs_to :vehicle_manufacturer
end
