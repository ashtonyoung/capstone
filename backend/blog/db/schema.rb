# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_25_041602) do
  create_table "chapters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "expires_at"
    t.boolean "sealed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: true
    t.integer "event_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: true
    t.integer "user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "target_date"
    t.integer "status"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "chapter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: true
    t.boolean "published", default: true
    t.datetime "written_at"
    t.integer "emotion", default: 1
    t.index ["chapter_id"], name: "index_posts_on_chapter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "handle"
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: true
  end

  add_foreign_key "chapters", "events"
  add_foreign_key "events", "users"
  add_foreign_key "goals", "events"
  add_foreign_key "posts", "chapters"
end
