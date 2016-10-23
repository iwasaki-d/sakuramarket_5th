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

ActiveRecord::Schema.define(version: 20161023084013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_commodities", force: :cascade do |t|
    t.integer  "cart_id",      null: false
    t.integer  "commodity_id", null: false
    t.integer  "quantity",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "cart_commodities", ["cart_id"], name: "index_cart_commodities_on_cart_id", using: :btree
  add_index "cart_commodities", ["commodity_id"], name: "index_cart_commodities_on_commodity_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",                              null: false
    t.boolean  "ordered",              default: false, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "shipping_name"
    t.string   "shipping_email"
    t.string   "shipping_postal_code"
    t.string   "shipping_address"
    t.date     "delivery_date"
    t.string   "delivery_time"
    t.integer  "commodities_total",    default: 0,     null: false
    t.integer  "shipping_fee",         default: 0,     null: false
    t.integer  "settlement_fee",       default: 0,     null: false
    t.integer  "tax",                  default: 0,     null: false
    t.integer  "pay_total",            default: 0,     null: false
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "commodities", force: :cascade do |t|
    t.string   "name",         default: "",    null: false
    t.string   "description",  default: "",    null: false
    t.integer  "price",        default: 0,     null: false
    t.decimal  "position",     default: 0.0,   null: false
    t.boolean  "view_enabled", default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "cart_id",    null: false
    t.datetime "order_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id", using: :btree

  create_table "settlement_fees", force: :cascade do |t|
    t.integer  "from",       null: false
    t.integer  "to",         null: false
    t.integer  "fee",        null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
