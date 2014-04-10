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

ActiveRecord::Schema.define(version: 20140410113805) do

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
    t.integer  "user_id"
  end

  add_index "boards", ["subdomain"], name: "index_boards_on_subdomain", unique: true, using: :btree
  add_index "boards", ["user_id"], name: "index_boards_on_user_id", using: :btree

  create_table "ideas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "number_of_likes"
    t.integer  "number_of_dislikes"
    t.integer  "state"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "ideas", ["board_id"], name: "index_ideas_on_board_id", unique: true, using: :btree
  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id", using: :btree

  create_table "memberships", force: true do |t|
    t.integer  "board_id"
    t.integer  "user_id"
    t.boolean  "is_owner"
    t.boolean  "is_admin"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["board_id", "user_id"], name: "index_memberships_on_board_id_and_user_id", unique: true, using: :btree
  add_index "memberships", ["board_id"], name: "index_memberships_on_board_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "idea_id"
    t.integer  "user_id"
    t.boolean  "has_voted"
    t.boolean  "has_joined"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["idea_id"], name: "index_relationships_on_idea_id", using: :btree
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id", using: :btree

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
