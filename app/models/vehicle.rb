# frozen_string_literal: true

# app/models/vehicle.rb
class Vehicle < ApplicationRecord
  belongs_to :vehicle_model

  acts_as_mappable lat_column_name: :latitude,
                   lng_column_name: :longitude

  scope :available, -> { where(is_available: true) }
  scope :verified, -> { where(is_verified: true) }

  # TODO: use paranoia gem for soft delete record with embedded methods
  scope :deleted, -> { where.not(deleted_at: nil) }

  scope :filter_all, -> { available.verified.deleted }
end
