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

ActiveRecord::Schema.define(version: 20140906223256) do

  create_table "comments", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dues", force: true do |t|
    t.integer  "user_id"
    t.integer  "utility_id"
    t.decimal  "amount",     precision: 6, scale: 2
    t.boolean  "paid",                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: true do |t|
    t.integer  "property_id"
    t.text     "description"
    t.boolean  "fixed",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "posts", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "body"
  end

  create_table "properties", force: true do |t|
    t.string   "address"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "landlord_name"
    t.string   "landlord_phone"
    t.string   "landlord_email"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
    t.decimal  "rent",               precision: 6, scale: 2
  end

  create_table "rental_terms", force: true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_rating"
    t.integer  "landlord_rating"
  end

  create_table "rentals", force: true do |t|
    t.string   "type"
    t.string   "address"
    t.integer  "rentor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roommates", force: true do |t|
    t.integer "user_id"
    t.integer "roommate_id"
    t.integer "rental_term_id"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "user_type",              default: "rentor"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_file_name"
    t.string   "profile_content_type"
    t.integer  "profile_file_size"
    t.datetime "profile_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "utilities", force: true do |t|
    t.integer  "property_id"
    t.string   "provider"
    t.date     "due_by"
    t.decimal  "cost",        precision: 6, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
