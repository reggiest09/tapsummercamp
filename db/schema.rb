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

ActiveRecord::Schema.define(version: 20170517053919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string   "name"
    t.string   "grade"
    t.date     "dob"
    t.string   "home_address"
    t.integer  "shirt_size"
    t.integer  "short_size"
    t.text     "allergies"
    t.string   "soccer_postiion",              array: true
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "children", ["user_id"], name: "index_children_on_user_id", using: :btree

  create_table "children_names", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.string   "gender"
    t.string   "grade"
    t.string   "school_name"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stripe_charges", force: :cascade do |t|
    t.float    "amount"
    t.string   "currency",           default: "usd"
    t.text     "description"
    t.integer  "stripe_customer_id"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "stripe_customers", force: :cascade do |t|
    t.string   "object"
    t.string   "description"
    t.boolean  "livemode"
    t.integer  "created_timestamp"
    t.string   "reference_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "stripe_plans", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "plan_name"
    t.string   "price"
    t.string   "reference_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "plan_type"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "plan_name"
    t.integer  "user_id"
    t.string   "stripe_card_token"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "active",             default: true
    t.integer  "stripe_customer_id"
    t.boolean  "tos_payment",        default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "plan"
    t.string   "plan_name"
    t.boolean  "tos_payment",            default: false
    t.string   "holiday"
    t.string   "phone"
    t.string   "primary_phone"
    t.string   "dob"
    t.string   "grand_level"
    t.string   "event"
    t.string   "shirt_size"
    t.string   "company"
    t.string   "register_for"
    t.string   "player_weight"
    t.string   "amount"
    t.string   "parent_name"
    t.string   "parent_email"
    t.string   "child_name"
    t.integer  "child_count"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "age"
    t.string   "school_name"
    t.integer  "grade_year"
    t.string   "home_address"
    t.string   "home_city"
    t.string   "home_state"
    t.string   "home_zip_code"
    t.text     "ada_accommodation"
    t.string   "parent_gurdin_email"
    t.string   "mother_name"
    t.string   "mother_day_number"
    t.string   "mother_cell_num"
    t.string   "father_name"
    t.string   "father_day_number"
    t.string   "father_cell_number"
    t.text     "persons_auth"
    t.text     "other_arrangements"
    t.text     "emergency_contact"
    t.text     "child_health_prob"
    t.boolean  "child_medication"
    t.text     "child_medication_desc"
    t.text     "snack"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "children", "users"
end
