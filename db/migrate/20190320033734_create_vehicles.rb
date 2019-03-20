class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.references :vehicle_model, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :mileage_id
      t.string :plate_num
      t.string :transmission
      t.integer :hourly_rate
      t.integer :daily_rate
      t.integer :weekly_rate
      t.integer :monthly_rate
      t.text :address
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.integer :delivery_rate
      t.text :pickup_instruction
      t.text :return_instruction
      t.text :description
      t.integer :view_count
      t.boolean :is_available
      t.boolean :is_verified
      t.integer :min_hour
      t.integer :max_hour
      t.boolean :is_image_verified
      t.datetime :deleted_at
      t.integer :booking_count
      t.decimal :rating, precision: 3, scale: 1
      t.jsonb :feature, default: {}
      t.integer :old_id
      t.timestamps
    end
  end
end
