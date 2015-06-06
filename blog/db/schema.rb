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

ActiveRecord::Schema.define(version: 20150510085602) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "surname",    limit: 255
    t.string   "nickname",   limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "password",   limit: 255
    t.string   "role",       limit: 255
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",     limit: 65535
    t.integer  "reply_to_id", limit: 4
    t.integer  "post_id",     limit: 4
    t.integer  "author_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["reply_to_id"], name: "index_comments_on_reply_to_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.integer  "author_id",  limit: 4
    t.text     "intro",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree

  create_table "sessions", id: false, force: :cascade do |t|
    t.string   "cookie",     limit: 255, null: false
    t.integer  "author_id",  limit: 4
    t.datetime "created_at"
  end

  add_index "sessions", ["author_id"], name: "index_sessions_on_author_id", using: :btree

end
