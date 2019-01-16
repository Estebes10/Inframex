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

ActiveRecord::Schema.define(version: 2019_01_15_214803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "blogs", force: :cascade do |t|
    t.string "name", limit: 256, null: false
    t.string "description", limit: 1024, null: false
    t.boolean "status", default: true, null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comments"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_blogs_on_project_id"
  end

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
    t.bigint "project_id"
    t.index ["category_id"], name: "index_concepts_on_category_id"
    t.index ["project_id"], name: "index_concepts_on_project_id"
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
    t.bigint "blog_id", null: false
    t.index ["blog_id"], name: "index_expenses_on_blog_id"
    t.index ["concept_id"], name: "index_expenses_on_concept_id"
    t.index ["subcategory_id"], name: "index_expenses_on_subcategory_id"
    t.index ["supplier_id"], name: "index_expenses_on_supplier_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name", limit: 256, null: false
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "concept_id"
    t.decimal "quantity"
    t.index ["blog_id"], name: "index_jobs_on_blog_id"
    t.index ["concept_id"], name: "index_jobs_on_concept_id"
  end

  create_table "privileges", force: :cascade do |t|
    t.string "name", limit: 256, null: false
    t.text "description"
    t.string "module_name", limit: 256, null: false
    t.string "str_id", limit: 256, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", limit: 256, null: false
    t.string "code", limit: 32
    t.string "address", limit: 256
    t.date "start_date"
    t.date "due_date"
    t.string "client", limit: 256
    t.boolean "status", default: true, null: false
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

  create_table "user_projects", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
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

  add_foreign_key "blogs", "projects"
  add_foreign_key "concepts", "categories"
  add_foreign_key "concepts", "projects"
  add_foreign_key "expenses", "blogs"
  add_foreign_key "expenses", "concepts"
  add_foreign_key "expenses", "subcategories"
  add_foreign_key "expenses", "suppliers"
  add_foreign_key "jobs", "blogs"
  add_foreign_key "jobs", "concepts"
  add_foreign_key "roleprivileges", "privileges"
  add_foreign_key "roleprivileges", "roles"
  add_foreign_key "user_projects", "projects"
  add_foreign_key "user_projects", "users"
  add_foreign_key "users", "roles"
end
