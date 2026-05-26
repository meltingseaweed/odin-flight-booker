# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_26_022928) do
  create_table "airports", force: :cascade do |t|
    t.string "city"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "arrivals", force: :cascade do |t|
    t.integer "arriving_airport_id", null: false
    t.integer "arriving_flights_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arriving_airport_id"], name: "index_arrivals_on_arriving_airport_id"
    t.index ["arriving_flights_id"], name: "index_arrivals_on_arriving_flights_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "arrival_airport"
    t.datetime "created_at", null: false
    t.string "departure_airport"
    t.integer "duration"
    t.datetime "start"
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "departing_airport_id", null: false
    t.integer "departing_flights_id", null: false
    t.datetime "updated_at", null: false
    t.index ["departing_airport_id"], name: "index_schedules_on_departing_airport_id"
    t.index ["departing_flights_id"], name: "index_schedules_on_departing_flights_id"
  end

  add_foreign_key "arrivals", "airports", column: "arriving_airport_id"
  add_foreign_key "arrivals", "flights", column: "arriving_flights_id"
  add_foreign_key "schedules", "airports", column: "departing_airport_id"
  add_foreign_key "schedules", "flights", column: "departing_flights_id"
end
