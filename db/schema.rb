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

ActiveRecord::Schema.define(version: 20180909084158) do

  create_table "children", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "gender"
    t.integer  "kindergarden_id"
    t.string   "className"
    t.integer  "classNumber"
    t.boolean  "allday"
    t.string   "thumbnail"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "alt"
    t.string   "hint"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kindergardens", force: :cascade do |t|
    t.string   "sidoname"
    t.string   "sigunguname"
    t.string   "stcode"
    t.string   "crname"
    t.string   "crtypename"
    t.string   "crstatusname"
    t.string   "zipcode"
    t.string   "craddr"
    t.string   "crtelno"
    t.string   "crfaxno"
    t.string   "crhome"
    t.integer  "nrtrroomcnt"
    t.integer  "nrtrroomsize"
    t.integer  "plgrdco"
    t.integer  "chcrtescnt"
    t.integer  "crcapat"
    t.integer  "crchcnt"
    t.string   "la"
    t.string   "lo"
    t.string   "crcargbname"
    t.string   "crcnfmdt"
    t.string   "crpausebegindt"
    t.string   "crpauseenddt"
    t.string   "crabldt"
    t.string   "crspec"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.date     "recordDate"
    t.integer  "participation"
    t.integer  "meal"
    t.integer  "activity"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "child_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "grade"
    t.integer  "kindergarden_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.integer  "userage"
    t.string   "usersex"
    t.string   "usertype"
    t.string   "telephone"
    t.integer  "career"
    t.string   "certification"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
