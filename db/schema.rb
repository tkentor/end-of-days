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

ActiveRecord::Schema.define(version: 20160305174259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.string   "takeaway"
    t.string   "action"
    t.string   "sources"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hero"
  end

  create_table "citations", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "source"
  end

  add_index "citations", ["article_id"], name: "index_citations_on_article_id", using: :btree
  add_index "citations", ["story_id"], name: "index_citations_on_story_id", using: :btree

  create_table "depictions", force: :cascade do |t|
    t.integer  "picture_id"
    t.integer  "article_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "depictions", ["article_id"], name: "index_depictions_on_article_id", using: :btree
  add_index "depictions", ["picture_id"], name: "index_depictions_on_picture_id", using: :btree
  add_index "depictions", ["story_id"], name: "index_depictions_on_story_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "name"
    t.string   "rating"
  end

  create_table "stories", force: :cascade do |t|
    t.text     "title"
    t.string   "link"
    t.text     "excerpt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
    t.string   "take"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "article_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["article_id"], name: "index_taggings_on_article_id", using: :btree
  add_index "taggings", ["story_id"], name: "index_taggings_on_story_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "citations", "articles"
  add_foreign_key "citations", "stories"
  add_foreign_key "depictions", "articles"
  add_foreign_key "depictions", "pictures"
  add_foreign_key "depictions", "stories"
  add_foreign_key "taggings", "articles"
  add_foreign_key "taggings", "stories"
  add_foreign_key "taggings", "tags"
end
