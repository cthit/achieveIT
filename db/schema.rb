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

ActiveRecord::Schema.define(version: 20151005174618) do

  create_table "achievements", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "provider_id"
    t.string   "category"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
    t.string   "code"
  end

  add_index "achievements", ["provider_id"], name: "index_achievements_on_provider_id"

  create_table "api_keys", force: :cascade do |t|
    t.string "provider"
    t.string "key"
  end

  create_table "providers", force: :cascade do |t|
    t.string   "api_key"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unlocks", force: :cascade do |t|
    t.string   "cid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "achievement_id"
  end

  add_index "unlocks", ["achievement_id"], name: "index_unlocks_on_achievement_id"

end
