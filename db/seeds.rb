# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

def import_vehicle_manufacturer
  Vehicle.transaction do
    import_csv_from_file('vehicle_manufacturers.csv', :vehicle_manufacturer)
    import_csv_from_file('vehicle_models.csv', :vehicle_model)
    import_csv_from_file('vehicles.csv', :vehicle)
  end
end

def import_csv_from_file(file_name, model_name)
  file_path = Rails.root.join('lib', 'seeds', file_name)
  text = File.read(file_path)
  csv = CSV.parse(text, headers: true)
  model = model_name.to_s.camelize.singularize.constantize

  Rails.logger.info "seeding #{model} model..."
  csv.each do |row|
    model.create! row.to_h
  end
  Rails.logger.info "completed seeding #{model} model"
end

import_vehicle_manufacturer
