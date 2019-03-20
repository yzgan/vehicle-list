class CreateVehicleModels < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_models do |t|
      t.references :vehicle_manufacturer, foreign_key: true
      t.string :name
      t.integer :vehicle_type_id
      t.integer :seats
      t.integer :doors

      t.timestamps
    end
  end
end
