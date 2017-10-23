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

ActiveRecord::Schema.define(version: 20171023180445) do

  create_table "invites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "invitee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invites", ["invitee_id"], name: "index_invites_on_invitee_id"
  add_index "invites", ["user_id"], name: "index_invites_on_user_id"

  create_table "networks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "networkee_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "networks", ["networkee_id"], name: "index_networks_on_networkee_id"
  add_index "networks", ["user_id"], name: "index_networks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
