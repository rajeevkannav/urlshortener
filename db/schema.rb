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

ActiveRecord::Schema.define(version: 2018_05_25_024832) do

  create_table "punches", force: :cascade do |t|
    t.integer "web_address_id"
    t.string "ip_address"
    t.string "http_referer"
    t.text "request_object"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.string "platform"
    t.string "browser"
    t.string "user_agent_metadata"
    t.index ["web_address_id"], name: "index_punches_on_web_address_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "web_addresses", force: :cascade do |t|
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tiny_url"
    t.integer "user_id"
    t.index ["tiny_url"], name: "index_web_addresses_on_tiny_url", unique: true
    t.index ["user_id"], name: "index_web_addresses_on_user_id"
  end

end
