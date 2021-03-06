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

ActiveRecord::Schema.define(version: 20150530112039) do

  create_table "petitions", force: :cascade do |t|
    t.text     "description",     limit: 65535
    t.date     "lend_start_date"
    t.date     "lend_end_date"
    t.boolean  "accepted",        limit: 1
    t.integer  "user_id",         limit: 4
    t.integer  "product_id",      limit: 4
    t.datetime "created_at"
  end

  add_index "petitions", ["product_id"], name: "index_petitions_on_product_id", using: :btree
  add_index "petitions", ["user_id"], name: "index_petitions_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "kind",               limit: 255
    t.boolean  "lent",               limit: 1,                              default: false
    t.boolean  "lendable",           limit: 1,                              default: true
    t.text     "description",        limit: 65535
    t.decimal  "pricenew",                         precision: 10, scale: 2
    t.decimal  "pricenow",                         precision: 10, scale: 2
    t.string   "state",              limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255, default: "", null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "fullname",               limit: 255
    t.string   "role",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
