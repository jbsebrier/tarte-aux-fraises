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

ActiveRecord::Schema.define(version: 20160720155306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "couples", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "member1_name"
    t.string   "member2_name"
    t.integer  "couple_rating"
    t.string   "couple_picture"
    t.string   "about_member1"
    t.string   "about_member2"
    t.string   "couple_nickname"
    t.string   "gender_member_1"
    t.string   "gender_member_2"
    t.string   "age_member_1"
    t.string   "age_member_2"
    t.string   "about_couple"
    t.string   "couple_city"
  end

  add_index "couples", ["email"], name: "index_couples_on_email", unique: true, using: :btree
  add_index "couples", ["reset_password_token"], name: "index_couples_on_reset_password_token", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "couple_id"
    t.date     "date"
    t.text     "description"
    t.integer  "max_n_guest_couples"
    t.string   "city"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "events", ["couple_id"], name: "index_events_on_couple_id", using: :btree

  create_table "swipes", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "couple_id"
    t.boolean  "organizing_couple_swipe"
    t.boolean  "guest_couple_swipe"
    t.boolean  "match"
    t.datetime "match_time"
    t.boolean  "participation"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "organizing_couple_swipe_result"
    t.boolean  "guest_couple_swipe_result"
  end

  add_index "swipes", ["couple_id"], name: "index_swipes_on_couple_id", using: :btree
  add_index "swipes", ["event_id"], name: "index_swipes_on_event_id", using: :btree

  add_foreign_key "events", "couples"
  add_foreign_key "swipes", "couples"
  add_foreign_key "swipes", "events"
end
