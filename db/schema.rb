# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_27_161233) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "look_subcategories", force: :cascade do |t|
    t.bigint "subcategory_id", null: false
    t.bigint "look_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["look_id"], name: "index_look_subcategories_on_look_id"
    t.index ["subcategory_id"], name: "index_look_subcategories_on_subcategory_id"
  end

  create_table "looks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outfit_pieces", force: :cascade do |t|
    t.bigint "outfit_id", null: false
    t.bigint "piece_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["outfit_id"], name: "index_outfit_pieces_on_outfit_id"
    t.index ["piece_id"], name: "index_outfit_pieces_on_piece_id"
  end

  create_table "outfits", force: :cascade do |t|
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.bigint "subcategory_id", null: false
    t.integer "worn_stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcategory_id"], name: "index_pieces_on_subcategory_id"
    t.index ["user_id"], name: "index_pieces_on_user_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.integer "temperature_range"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "look_subcategories", "looks"
  add_foreign_key "look_subcategories", "subcategories"
  add_foreign_key "outfit_pieces", "outfits"
  add_foreign_key "outfit_pieces", "pieces"
  add_foreign_key "pieces", "subcategories"
  add_foreign_key "pieces", "users"
  add_foreign_key "subcategories", "categories"
end
