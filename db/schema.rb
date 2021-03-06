# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160506182745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyms", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "home_city_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "logo_url"
    t.string   "address"
  end

  add_index "gyms", ["home_city_id"], name: "index_gyms_on_home_city_id", using: :btree

  create_table "home_cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",          null: false
    t.string   "password_digest"
    t.string   "session_token"
    t.integer  "gym_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "profile_image_url"
    t.integer  "age",               null: false
    t.integer  "weight",            null: false
  end

  add_index "users", ["gym_id"], name: "index_users_on_gym_id", using: :btree

  create_table "workout_exercises", force: :cascade do |t|
    t.integer "workout_id",  null: false
    t.integer "exercise_id", null: false
    t.integer "sets",        null: false
    t.integer "reps",        null: false
  end

  add_index "workout_exercises", ["workout_id"], name: "index_workout_exercises_on_workout_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.date     "date",       null: false
    t.time     "time",       null: false
    t.integer  "buddy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "workouts", ["buddy_id"], name: "index_workouts_on_buddy_id", using: :btree
  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id", using: :btree

end
