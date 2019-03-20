# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_20_033734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.bigint "vehicle_manufacturer_id"
    t.string "name"
    t.integer "vehicle_type_id"
    t.integer "seats"
    t.integer "doors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_manufacturer_id"], name: "index_vehicle_models_on_vehicle_manufacturer_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "vehicle_model_id"
    t.bigint "user_id"
    t.integer "mileage_id"
    t.string "plate_num"
    t.string "transmission"
    t.integer "hourly_rate"
    t.integer "daily_rate"
    t.integer "weekly_rate"
    t.integer "monthly_rate"
    t.text "address"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.integer "delivery_rate"
    t.text "pickup_instruction"
    t.text "return_instruction"
    t.text "description"
    t.integer "view_count"
    t.boolean "is_available"
    t.boolean "is_verified"
    t.integer "min_hour"
    t.integer "max_hour"
    t.boolean "is_image_verified"
    t.datetime "deleted_at"
    t.integer "booking_count"
    t.decimal "rating", precision: 3, scale: 1
    t.jsonb "feature", default: {}
    t.integer "old_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
    t.index ["vehicle_model_id"], name: "index_vehicles_on_vehicle_model_id"
  end

  add_foreign_key "vehicle_models", "vehicle_manufacturers"
  add_foreign_key "vehicles", "users"
  add_foreign_key "vehicles", "vehicle_models"
end
