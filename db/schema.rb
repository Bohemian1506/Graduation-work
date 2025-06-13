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

ActiveRecord::Schema[7.2].define(version: 2025_06_13_135013) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_organizers", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id"
    t.integer "role", default: 1, null: false
    t.integer "status", default: 0, null: false
    t.string "invitation_token", null: false
    t.string "invited_email", null: false
    t.datetime "invited_at"
    t.datetime "accepted_at"
    t.datetime "declined_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "invited_email"], name: "index_event_organizers_on_event_and_email", unique: true, where: "(user_id IS NULL)"
    t.index ["event_id", "user_id"], name: "index_event_organizers_on_event_and_user", unique: true, where: "(user_id IS NOT NULL)"
    t.index ["event_id"], name: "index_event_organizers_on_event_id"
    t.index ["invitation_token"], name: "index_event_organizers_on_invitation_token", unique: true
    t.index ["user_id"], name: "index_event_organizers_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "event_date", null: false
    t.string "store_name", null: false
    t.text "location"
    t.integer "capacity"
    t.integer "party_fee"
    t.integer "party_type", default: 0
    t.integer "event_status", default: 0
    t.integer "visibility", default: 1
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_date"], name: "index_events_on_event_date"
    t.index ["event_status"], name: "index_events_on_event_status"
    t.index ["party_type"], name: "index_events_on_party_type"
    t.index ["title"], name: "index_events_on_title"
    t.index ["user_id"], name: "index_events_on_user_id"
    t.index ["visibility"], name: "index_events_on_visibility"
  end

  create_table "task_assignments", force: :cascade do |t|
    t.bigint "assignable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "assignable_type", null: false
    t.index ["assignable_id", "assignable_type", "user_id"], name: "index_assignments_on_assignable_and_user", unique: true
    t.index ["assignable_id", "user_id"], name: "index_task_assignments_on_assignable_id_and_user_id", unique: true
    t.index ["assignable_id"], name: "index_task_assignments_on_assignable_id"
    t.index ["user_id"], name: "index_task_assignments_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "due_date"
    t.integer "task_status"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tasks_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "event_organizers", "events"
  add_foreign_key "event_organizers", "users"
  add_foreign_key "events", "users"
  add_foreign_key "task_assignments", "tasks", column: "assignable_id"
  add_foreign_key "task_assignments", "users"
  add_foreign_key "tasks", "events"
end
