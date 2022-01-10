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

ActiveRecord::Schema.define(version: 2022_01_05_170502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.index ["name"], name: "index_admins_on_name"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "class_id"
    t.datetime "time_start"
    t.datetime "time_end"
    t.bigint "weekday_id", null: false
    t.bigint "teacher_id", null: false
    t.bigint "subject_id", null: false
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
    t.index ["time_start", "time_end", "class_id"], name: "index_lessons_on_time_start_and_time_end_and_class_id"
    t.index ["weekday_id"], name: "index_lessons_on_weekday_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_subjects_on_name"
  end

  create_table "teacher_subjects", force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["subject_id"], name: "index_teacher_subjects_on_subject_id"
    t.index ["teacher_id"], name: "index_teacher_subjects_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "fio"
    t.index ["fio"], name: "index_teachers_on_fio"
  end

  create_table "weekdays", force: :cascade do |t|
    t.string "day", null: false
    t.index ["day"], name: "index_weekdays_on_day"
  end

  add_foreign_key "lessons", "subjects"
  add_foreign_key "lessons", "teachers"
  add_foreign_key "lessons", "weekdays"
  add_foreign_key "teacher_subjects", "subjects"
  add_foreign_key "teacher_subjects", "teachers"
end
