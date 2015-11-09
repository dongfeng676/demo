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

ActiveRecord::Schema.define(version: 20151027134348) do

  create_table "apps", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "brief_introduce", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "text",           limit: 65535
    t.integer  "lock_version",   limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "type",           limit: 255
    t.integer  "comments_count", limit: 4
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text",         limit: 65535
    t.integer  "lock_version", limit: 4
    t.integer  "article_id",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "computers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "version",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "serve_app_relations", force: :cascade do |t|
    t.integer  "server_id",  limit: 4
    t.integer  "app_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "serve_app_relations", ["app_id"], name: "index_serve_app_relations_on_app_id", using: :btree
  add_index "serve_app_relations", ["server_id"], name: "index_serve_app_relations_on_server_id", using: :btree

  create_table "servers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "ip",         limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "age",        limit: 4
    t.integer  "height",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "teacher_id", limit: 4
  end

  add_index "students", ["teacher_id"], name: "index_students_on_teacher_id", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "age",        limit: 4
    t.integer  "height",     limit: 4
    t.string   "phone",      limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "comments", "articles"
  add_foreign_key "serve_app_relations", "apps"
  add_foreign_key "serve_app_relations", "servers"
end
