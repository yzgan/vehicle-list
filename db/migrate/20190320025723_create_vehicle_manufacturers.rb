class CreateVehicleManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_manufacturers do |t|
      t.string :name

      t.timestamps
    end
  end
end
