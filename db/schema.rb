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

ActiveRecord::Schema.define(version: 20170731203729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "project_user_assignements", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "customer_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["name"], name: "index_projects_on_name"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["name"], name: "index_tasks_on_name"
  end

  create_table "time_entries", id: :serial, force: :cascade do |t|
    t.text "title"
    t.integer "task_id"
    t.integer "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "description"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_time_entry_on_task_id"
    t.index ["user_id"], name: "index_time_entry_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "authentication_token"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "level"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
