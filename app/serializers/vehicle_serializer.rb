# frozen_string_literal: true

# app/serializers/vehicle_serializer.rb
class VehicleSerializer
  include FastJsonapi::ObjectSerializer

  attributes :year, :plate_num, :transmission, :latitude, :longitude,
             :return_instruction, :user_id

  attribute :distance do |vehicle, params|
    vehicle.distance_from(params[:location], units: Geokit.default_units)
  end

  attribute :vehicle_id, &:id

  attribute :vehicle_model do |vehicle|
    "#{vehicle.vehicle_model.vehicle_manufacturer.name} #{vehicle.vehicle_model.name}".strip
  end
end
