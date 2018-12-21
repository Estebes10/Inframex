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

ActiveRecord::Schema.define(version: 2018_12_19_195341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 256, null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "subcategory_id", null: false
    t.string "name", limit: 256, null: false
    t.date "date", null: false
    t.integer "quantity", null: false
    t.string "unity", null: false
    t.decimal "unit_price", precision: 15, scale: 4, null: false
    t.decimal "total", precision: 15, scale: 4, null: false
    t.bigint "supplier_id", null: false
    t.boolean "status", default: false, null: false
    t.boolean "status_ticket", default: false, null: false
    t.index ["subcategory_id"], name: "index_expenses_on_subcategory_id"
    t.index ["supplier_id"], name: "index_expenses_on_supplier_id"
  end

  create_table "privileges", force: :cascade do |t|
    t.string "name", limit: 256, null: false
    t.text "description"
    t.string "module_name", limit: 256, null: false
    t.string "str_id", limit: 256, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roleprivileges", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.bigint "privilege_id"
    t.index ["privilege_id"], name: "index_roleprivileges_on_privilege_id"
    t.index ["role_id"], name: "index_roleprivileges_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 256, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name", limit: 256, null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name", limit: 256, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "lastName", limit: 128, null: false
    t.string "password", limit: 64
    t.date "birthday"
    t.string "email", limit: 128, null: false
    t.string "phone", limit: 20
    t.boolean "status", default: true
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "expenses", "subcategories"
  add_foreign_key "expenses", "suppliers"
  add_foreign_key "roleprivileges", "privileges"
  add_foreign_key "roleprivileges", "roles"
  add_foreign_key "users", "roles"
end
