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

ActiveRecord::Schema.define(version: 20150620173901) do

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "calculation_lines", force: :cascade do |t|
    t.integer "calculation_id", limit: 4
    t.integer "product_id",     limit: 4
    t.integer "hours",          limit: 4
    t.integer "amount",         limit: 4
  end

  add_index "calculation_lines", ["calculation_id"], name: "index_calculation_lines_on_calculation_id", using: :btree
  add_index "calculation_lines", ["product_id"], name: "index_calculation_lines_on_product_id", using: :btree

  create_table "calculations", force: :cascade do |t|
    t.string  "name",         limit: 255
    t.integer "post_code",    limit: 4
    t.string  "phone_number", limit: 255
    t.string  "email",        limit: 255
  end

  create_table "products", force: :cascade do |t|
    t.string  "name",               limit: 255
    t.string  "name_led",           limit: 255
    t.string  "name_incandescent",  limit: 255
    t.decimal "price_led",                      precision: 10, scale: 2
    t.integer "power_incandescent", limit: 4
    t.integer "power_led",          limit: 4
  end

end
