# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_29_104918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "account_type"
    t.string "account_number"
    t.text "desc"
    t.boolean "active", default: false
    t.bigint "user_id", null: false
    t.boolean "fully_approved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "codes", force: :cascade do |t|
    t.string "code"
    t.string "system_code"
    t.string "custom_code"
    t.string "barcode"
    t.string "codable_type", null: false
    t.bigint "codable_id", null: false
    t.boolean "active"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["codable_type", "codable_id"], name: "index_codes_on_codable_type_and_codable_id"
    t.index ["user_id"], name: "index_codes_on_user_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.string "type"
    t.boolean "active", default: true
    t.bigint "structure_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["structure_id"], name: "index_forms_on_structure_id"
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.text "memo"
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.boolean "checked", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.string "type"
    t.string "ancestry"
    t.string "category"
    t.boolean "income"
    t.boolean "direct_expense"
    t.boolean "indirect_expense"
    t.boolean "adminstrative_cost"
    t.boolean "active", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ancestry"], name: "index_organizations_on_ancestry"
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.string "type"
    t.string "ancestry"
    t.boolean "income"
    t.boolean "direct_expense"
    t.boolean "indirect_expense"
    t.boolean "adminstrative_cost"
    t.boolean "active", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "phone"
    t.string "email"
    t.string "phone_token"
    t.string "email_token"
    t.bigint "user_id", null: false
    t.bigint "structure_id", null: false
    t.bigint "images_id"
    t.text "desc"
    t.integer "inviter"
    t.boolean "confirmed_profile", default: false
    t.boolean "revoke_profile", default: false
    t.integer "confirmed_by"
    t.integer "revoked_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmed_by"], name: "index_profiles_on_confirmed_by"
    t.index ["email_token"], name: "index_profiles_on_email_token", unique: true
    t.index ["images_id"], name: "index_profiles_on_images_id"
    t.index ["inviter"], name: "index_profiles_on_inviter"
    t.index ["phone_token"], name: "index_profiles_on_phone_token", unique: true
    t.index ["revoked_by"], name: "index_profiles_on_revoked_by"
    t.index ["structure_id"], name: "index_profiles_on_structure_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.string "type"
    t.string "ancestry"
    t.string "category"
    t.boolean "active", default: true
    t.integer "structure_id"
    t.string "structurable_type"
    t.bigint "structurable_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ancestry", "structure_id"], name: "index_structures_on_ancestry_and_structure_id"
    t.index ["structurable_type", "structurable_id"], name: "index_structures_on_structurable_type_and_structurable_id"
    t.index ["user_id"], name: "index_structures_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "payable_type", null: false
    t.bigint "payable_id", null: false
    t.bigint "structure_id", null: false
    t.string "type"
    t.float "money_in"
    t.float "money_out"
    t.float "transaction_cost"
    t.float "balance"
    t.float "total_balance"
    t.text "memo"
    t.bigint "image_id", null: false
    t.bigint "account_id", null: false
    t.bigint "user_id", null: false
    t.boolean "checked", default: false
    t.boolean "closed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["image_id"], name: "index_transactions_on_image_id"
    t.index ["payable_type", "payable_id"], name: "index_transactions_on_payable_type_and_payable_id"
    t.index ["structure_id"], name: "index_transactions_on_structure_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "active", default: true
    t.string "device"
    t.text "device_desc"
    t.string "phone_token"
    t.boolean "phone_confirmed", default: false
    t.datetime "phone_token_sent_at"
    t.datetime "phone_confirmed_at"
    t.string "email_token"
    t.boolean "email_confirmed", default: false
    t.datetime "email_token_sent_at"
    t.datetime "email_confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "user_confirmed", default: false
    t.boolean "forgot_password", default: false
    t.datetime "reset_password_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "reset_password_reset_at"
    t.integer "reset_password_count", default: 0
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "unlocked_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["email_token"], name: "index_users_on_email_token", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["phone_token"], name: "index_users_on_phone_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "codes", "users"
  add_foreign_key "forms", "structures"
  add_foreign_key "forms", "users"
  add_foreign_key "organizations", "users"
  add_foreign_key "products", "users"
  add_foreign_key "profiles", "images", column: "images_id"
  add_foreign_key "profiles", "structures"
  add_foreign_key "profiles", "users"
  add_foreign_key "structures", "users"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "images"
  add_foreign_key "transactions", "structures"
  add_foreign_key "transactions", "users"
end
