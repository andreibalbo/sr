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

ActiveRecord::Schema.define(version: 20180828120608) do

  create_table "avatars", force: :cascade do |t|
    t.string   "base64"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "avatars", ["user_id"], name: "index_avatars_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "occurrence_id"
  end

  add_index "comments", ["occurrence_id"], name: "index_comments_on_occurrence_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "images", force: :cascade do |t|
    t.string   "base64"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "occurrence_id"
  end

  add_index "images", ["occurrence_id"], name: "index_images_on_occurrence_id"

  create_table "notifications", force: :cascade do |t|
    t.string   "message"
    t.boolean  "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "occurrences", force: :cascade do |t|
    t.date     "date"
    t.string   "description"
    t.integer  "stars"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.boolean  "occurrence_type"
    t.string   "animal_type"
    t.string   "animal_color"
    t.string   "animal_size"
    t.float    "location_lat"
    t.float    "location_lon"
    t.text     "location_string"
  end

  add_index "occurrences", ["user_id"], name: "index_occurrences_on_user_id"

  create_table "stars", force: :cascade do |t|
    t.integer  "from"
    t.integer  "to"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "occurrence_id"
    t.integer  "user_id"
  end

  add_index "stars", ["occurrence_id"], name: "index_stars_on_occurrence_id"
  add_index "stars", ["user_id"], name: "index_stars_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.date     "birth_dt"
    t.string   "cpf"
    t.string   "postal_code"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
