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

ActiveRecord::Schema.define(version: 20150927043736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "errands", force: :cascade do |t|
    t.string   "title"
    t.string   "item_name"
    t.float    "price"
    t.string   "store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "runner_id"
    t.integer  "owner_id"
  end

  add_index "errands", ["owner_id"], name: "index_errands_on_owner_id", using: :btree
  add_index "errands", ["runner_id"], name: "index_errands_on_runner_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "errands", "users", column: "owner_id"
  add_foreign_key "errands", "users", column: "runner_id"
end
