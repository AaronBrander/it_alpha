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

ActiveRecord::Schema.define(version: 20140409195439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: true do |t|
    t.string   "subdomain"
    t.string   "name"
    t.text     "description"
    t.text     "keywords"
    t.string   "company_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone_number"
    t.string   "contact_email"
    t.integer  "state"
    t.boolean  "is_private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["subdomain"], name: "index_boards_on_subdomain", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "state"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
