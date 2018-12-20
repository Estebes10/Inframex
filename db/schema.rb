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

ActiveRecord::Schema.define(version: 2018_12_20_032410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 256, null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "code", limit: 6, null: false
    t.string "description", limit: 1024, null: false
    t.decimal "quantity", null: false
    t.string "unity", null: false
    t.decimal "unit_price", precision: 15, scale: 4, null: false
    t.decimal "total", precision: 15, scale: 4, null: false
    t.index ["category_id"], name: "index_concepts_on_category_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "subcategory_id", null: false
    t.string "name", limit: 256, null: false
    t.date "date", null: false
    t.decimal "quantity", null: false
    t.string "unity", null: false
    t.decimal "unit_price", precision: 15, scale: 4, null: false
    t.decimal "total", precision: 15, scale: 4, null: false
    t.bigint "supplier_id", null: false
    t.boolean "status", default: false, null: false
    t.boolean "status_ticket", default: false, null: false
    t.bigint "concept_id", null: false
    t.index ["concept_id"], name: "index_expenses_on_concept_id"
    t.index ["subcategory_id"], name: "index_expenses_on_subcategory_id"
    t.index ["supplier_id"], name: "index_expenses_on_supplier_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name", limit: 256, null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name", limit: 256, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastName"
    t.string "password"
    t.date "birthday"
    t.string "email"
    t.string "phone"
    t.boolean "status", default: true
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "concepts", "categories"
  add_foreign_key "expenses", "concepts"
  add_foreign_key "expenses", "subcategories"
  add_foreign_key "expenses", "suppliers"
end
