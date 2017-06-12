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

ActiveRecord::Schema.define(version: 20170610025114) do

  create_table "activities", force: :cascade do |t|
    t.string "action_type"
    t.string "content_action"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.boolean "is_correct"
    t.integer "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_answers_on_word_id"
  end

  create_table "cagetories", force: :cascade do |t|
    t.string "name"
    t.integer "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_cagetories_on_word_id"
  end

  create_table "lesson_words", force: :cascade do |t|
    t.integer "word_id"
    t.integer "lesson_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_lesson_words_on_answer_id"
    t.index ["lesson_id"], name: "index_lesson_words_on_lesson_id"
    t.index ["word_id"], name: "index_lesson_words_on_word_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cagetory_id"
    t.boolean "is_learned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cagetory_id"], name: "index_lessons_on_cagetory_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "following_id"
    t.integer "folower_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "content"
    t.integer "lesson_word_id"
    t.integer "cagetory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cagetory_id"], name: "index_words_on_cagetory_id"
    t.index ["lesson_word_id"], name: "index_words_on_lesson_word_id"
  end

end
