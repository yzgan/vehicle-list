# frozen_string_literal: true

# app/models/vehicle.rb
class Vehicle < ApplicationRecord
  belongs_to :vehicle_model

  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude
end
