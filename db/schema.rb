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

ActiveRecord::Schema.define(version: 20140814030013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", force: true do |t|
    t.string   "name",                       null: false
    t.integer  "year"
    t.string   "creator",                    null: false
    t.boolean  "ongoing",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists_users", force: true do |t|
    t.integer "user_id"
    t.integer "list_id"
  end

  create_table "movies", force: true do |t|
    t.string   "movie_title"
    t.string   "aka_title"
    t.integer  "year"
    t.string   "description"
    t.string   "director"
    t.string   "actors",      default: [], array: true
    t.string   "imdbid"
    t.string   "poster"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rankings", force: true do |t|
    t.integer  "doable_id"
    t.string   "doable_type"
    t.integer  "list_id"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rankings", ["doable_id", "doable_type"], name: "index_rankings_on_doable_id_and_doable_type", using: :btree
  add_index "rankings", ["list_id"], name: "index_rankings_on_list_id", using: :btree

  create_table "tasks", force: true do |t|
    t.integer  "user_id",                     null: false
    t.integer  "doable_id",                   null: false
    t.string   "doable_type",                 null: false
    t.boolean  "done",        default: false, null: false
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                     null: false
    t.string   "email",                        null: false
    t.string   "crypted_password",             null: false
    t.string   "salt",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
