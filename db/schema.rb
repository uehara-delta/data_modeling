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

ActiveRecord::Schema.define(version: 2019_10_28_073453) do

  create_table "comments", force: :cascade do |t|
    t.integer "instructor_id", null: false
    t.integer "reservation_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["instructor_id"], name: "index_comments_on_instructor_id"
    t.index ["reservation_id"], name: "index_comments_on_reservation_id", unique: true
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

  add_foreign_key "comments", "instructors"
  add_foreign_key "comments", "reservations"
  add_foreign_key "reservations", "lessons"
  add_foreign_key "reservations", "students"
end