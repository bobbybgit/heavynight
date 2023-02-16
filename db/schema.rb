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

ActiveRecord::Schema[7.0].define(version: 2023_02_16_202437) do
  create_table "attendances", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendances_on_event_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "event_settings", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "event_id", null: false
    t.integer "min_per_session"
    t.integer "max_per_session"
    t.float "max_weight"
    t.float "min_weight"
    t.integer "max_length"
    t.integer "min_length"
    t.boolean "use_rec_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_settings_on_event_id"
    t.index ["group_id"], name: "index_event_settings_on_group_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "group_id", null: false
    t.integer "venue_id", null: false
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.boolean "private"
    t.integer "event_setting_id", null: false
    t.integer "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_setting_id"], name: "index_events_on_event_setting_id"
    t.index ["group_id"], name: "index_events_on_group_id"
    t.index ["session_id"], name: "index_events_on_session_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "bgg_id"
    t.integer "min_player_count"
    t.integer "max_player_count"
    t.integer "min_rec_player_count"
    t.integer "max_rec_player_count"
    t.string "image"
    t.float "weight"
    t.float "rating"
    t.text "description"
    t.integer "user_id", null: false
    t.integer "venue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
    t.index ["venue_id"], name: "index_games_on_venue_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.text "description"
    t.boolean "private"
    t.integer "event_setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "region"
    t.string "location"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "image"
    t.index ["event_setting_id"], name: "index_groups_on_event_setting_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.integer "slot_number"
    t.integer "max_slots"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_sessions_on_event_id"
    t.index ["game_id"], name: "index_sessions_on_game_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "surname"
    t.string "profile_image"
    t.boolean "site_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.integer "capacity"
    t.boolean "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wall_messages", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_wall_messages_on_group_id"
    t.index ["user_id"], name: "index_wall_messages_on_user_id"
  end

  add_foreign_key "attendances", "events"
  add_foreign_key "attendances", "users"
  add_foreign_key "event_settings", "events"
  add_foreign_key "event_settings", "groups"
  add_foreign_key "events", "event_settings"
  add_foreign_key "events", "groups"
  add_foreign_key "events", "sessions"
  add_foreign_key "events", "venues"
  add_foreign_key "games", "users"
  add_foreign_key "games", "venues"
  add_foreign_key "groups", "event_settings"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users"
  add_foreign_key "sessions", "events"
  add_foreign_key "sessions", "games"
  add_foreign_key "sessions", "users"
  add_foreign_key "wall_messages", "groups"
  add_foreign_key "wall_messages", "users"
end
