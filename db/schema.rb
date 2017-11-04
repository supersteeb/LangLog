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

ActiveRecord::Schema.define(version: 20171104133557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.integer  "test_id"
    t.integer  "correct_word"
    t.text     "false_word",   default: [],              array: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["test_id"], name: "index_questions_on_test_id", using: :btree
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "user_id"
    t.jsonb    "logs"
    t.integer  "test_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tests_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "is_admin",               default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "words", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "chinese"
    t.string   "english"
    t.string   "pinyin"
    t.string   "part_of_speech"
    t.text     "mnemonic"
    t.integer  "times_tested"
    t.integer  "times_correct"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["chinese"], name: "index_words_on_chinese", using: :btree
    t.index ["user_id"], name: "index_words_on_user_id", using: :btree
  end

  add_foreign_key "questions", "tests"
  add_foreign_key "tests", "users"
  add_foreign_key "words", "users"
end
