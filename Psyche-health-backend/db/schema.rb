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

ActiveRecord::Schema.define(version: 2022_09_08_091324) do

  create_table "appointments", force: :cascade do |t|
    t.integer "client_id"
    t.integer "therapist_id"
    t.date "date"
    t.index ["client_id"], name: "index_appointments_on_client_id"
    t.index ["therapist_id"], name: "index_appointments_on_therapist_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "client_name"
    t.string "problem"
  end

  create_table "counties", force: :cascade do |t|
    t.string "county_name"
    t.string "county_code"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "therapists", force: :cascade do |t|
    t.string "therapist_name"
    t.integer "years_of_experience"
    t.string "gender"
    t.string "phone"
    t.boolean "active"
    t.integer "county_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
