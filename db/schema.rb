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

ActiveRecord::Schema.define(version: 2020_08_28_161531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "action_type"
    t.integer "sad_happy", array: true
    t.integer "angry_calm", array: true
    t.integer "lowenergy_highenergy", array: true
    t.integer "anxious_social", array: true
    t.integer "duration"
    t.string "time_of_day", array: true
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.string "tags", array: true
    t.string "company_name"
    t.string "address"
    t.integer "price"
    t.float "latitude"
    t.float "longitude"
    t.string "photo_url"
  end

  create_table "moods", force: :cascade do |t|
    t.integer "sad_happy"
    t.integer "angry_calm"
    t.integer "lowenergy_highenergy"
    t.integer "anxious_social"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "manual_created_at"
    t.index ["user_id"], name: "index_moods_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "action_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_id"], name: "index_ratings_on_action_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "user_actions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "action_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_id"], name: "index_user_actions_on_action_id"
    t.index ["user_id"], name: "index_user_actions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "address"
    t.string "availability", array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "moods", "users"
  add_foreign_key "ratings", "actions"
  add_foreign_key "ratings", "users"
  add_foreign_key "user_actions", "actions"
  add_foreign_key "user_actions", "users"
end
