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

ActiveRecord::Schema.define(version: 20181208034213) do

  create_table "events", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "artist",                    null: false
    t.integer  "place_id",                  null: false
    t.date     "date",                      null: false
    t.string   "comment"
    t.boolean  "available",  default: true, null: false
    t.string   "hall",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "pref",       null: false
    t.string   "area",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "event_id",   null: false
    t.string   "kind",       null: false
    t.integer  "price",      null: false
    t.integer  "total",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "tel",                        null: false
    t.string   "password",                   null: false
    t.boolean  "admin",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
