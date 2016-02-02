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

ActiveRecord::Schema.define(version: 20160202190224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.integer "company_id"
    t.string  "name"
    t.string  "channel"
    t.string  "campaign_type"
    t.date    "campaign_date"
    t.string  "file_url"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "address"
    t.integer  "city_id"
    t.integer  "country_id"
    t.integer  "coupon_id"
    t.float    "default_labor_tax"
    t.float    "default_tax"
    t.integer  "defaultavatar_id"
    t.integer  "distributor_id"
    t.integer  "engineering_labor_cost"
    t.integer  "engineering_labor_price"
    t.string   "image_content_type"
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.time     "image_updated_at"
    t.integer  "install_labor_cost"
    t.integer  "install_labor_price"
    t.string   "int_address"
    t.string   "int_city"
    t.string   "int_state"
    t.string   "int_zipcode"
    t.integer  "intcurrency_id"
    t.string   "name"
    t.string   "phone"
    t.integer  "po_custom_id"
    t.string   "po_custom_prefix"
    t.integer  "programming_labor_cost"
    t.integer  "programming_labor_price"
    t.integer  "project_custom_id"
    t.string   "project_custom_prefix"
    t.text     "project_terms"
    t.string   "ship_address"
    t.integer  "ship_city_id"
    t.string   "ship_city_name"
    t.string   "ship_city_state"
    t.string   "ship_city_zip"
    t.boolean  "ship_taxes",              default: false
    t.string   "stripe_customer_token"
    t.integer  "supervision_labor_cost"
    t.integer  "supervision_labor_price"
    t.boolean  "tax_labor",               default: false
    t.string   "tax_name"
    t.integer  "trial_days"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", force: :cascade do |t|
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
