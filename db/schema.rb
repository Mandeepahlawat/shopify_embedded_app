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

ActiveRecord::Schema.define(version: 20150619194328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "shop_id"
    t.integer  "shopify_customer_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "customers", ["shop_id"], name: "index_customers_on_shop_id", using: :btree
  add_index "customers", ["shopify_customer_id"], name: "index_customers_on_shopify_customer_id", using: :btree

  create_table "form_attributes", force: :cascade do |t|
    t.string   "width"
    t.string   "border"
    t.string   "color"
    t.string   "background_color"
    t.string   "font_family"
    t.string   "button_color"
    t.integer  "shop_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "form_attributes", ["shop_id"], name: "index_form_attributes_on_shop_id", using: :btree

  create_table "recommendations", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "shopify_product_id"
    t.string   "friend_email"
    t.text     "comment"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", null: false
    t.string   "shopify_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true, using: :btree

end
