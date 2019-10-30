# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_29_095545) do

  create_table "belongings", force: :cascade do |t|
    t.integer "entertainer_id", null: false
    t.integer "office_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entertainer_id"], name: "index_belongings_on_entertainer_id"
    t.index ["office_id"], name: "index_belongings_on_office_id"
  end

  create_table "blood_pressures", force: :cascade do |t|
    t.integer "top_number"
    t.integer "bottom_number"
    t.integer "measurement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measurement_id"], name: "index_blood_pressures_on_measurement_id"
  end

  create_table "body_temperatures", force: :cascade do |t|
    t.float "value"
    t.integer "measurement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measurement_id"], name: "index_body_temperatures_on_measurement_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "instructor_id", null: false
    t.integer "reservation_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["instructor_id"], name: "index_comments_on_instructor_id"
    t.index ["reservation_id"], name: "index_comments_on_reservation_id", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entertainer_names", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.integer "entertainer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entertainer_id"], name: "index_entertainer_names_on_entertainer_id"
  end

  create_table "entertainers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exportables", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_exportables_on_country_id"
    t.index ["product_id"], name: "index_exportables_on_product_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.datetime "date_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "instructor_id"
    t.index ["instructor_id"], name: "index_lessons_on_instructor_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "measurer_id", null: false
    t.datetime "measured_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measurer_id"], name: "index_measurements_on_measurer_id"
    t.index ["patient_id"], name: "index_measurements_on_patient_id"
  end

  create_table "measurers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "program_names", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.integer "program_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_program_names_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pulses", force: :cascade do |t|
    t.integer "value"
    t.integer "measurement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measurement_id"], name: "index_pulses_on_measurement_id"
  end

  create_table "regular_performers", force: :cascade do |t|
    t.integer "program_id", null: false
    t.integer "entertainer_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entertainer_id"], name: "index_regular_performers_on_entertainer_id"
    t.index ["program_id"], name: "index_regular_performers_on_program_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "canceled"
    t.index ["lesson_id"], name: "index_reservations_on_lesson_id"
    t.index ["student_id"], name: "index_reservations_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "belongings", "entertainers"
  add_foreign_key "belongings", "offices"
  add_foreign_key "blood_pressures", "measurements"
  add_foreign_key "body_temperatures", "measurements"
  add_foreign_key "comments", "instructors"
  add_foreign_key "comments", "reservations"
  add_foreign_key "entertainer_names", "entertainers"
  add_foreign_key "exportables", "countries"
  add_foreign_key "exportables", "products"
  add_foreign_key "measurements", "measurers"
  add_foreign_key "measurements", "patients"
  add_foreign_key "program_names", "programs"
  add_foreign_key "pulses", "measurements"
  add_foreign_key "regular_performers", "entertainers"
  add_foreign_key "regular_performers", "programs"
  add_foreign_key "reservations", "lessons"
  add_foreign_key "reservations", "students"
end
