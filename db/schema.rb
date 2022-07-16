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

ActiveRecord::Schema.define(version: 2022_05_21_161947) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "details", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "work_id"
    t.string "status"
    t.index ["user_id"], name: "index_details_on_user_id"
    t.index ["work_id"], name: "index_details_on_work_id"
  end

  create_table "introductions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "phonenumber"
    t.text "contents"
    t.bigint "user_id", null: false
    t.bigint "work_id", null: false
    t.string "step"
    t.boolean "permission", default: false, null: false
    t.text "comment"
    t.index ["user_id"], name: "index_introductions_on_user_id"
    t.index ["work_id"], name: "index_introductions_on_work_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "work_id"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "name"
    t.index ["email"], name: "index_providers_on_email", unique: true
    t.index ["invitation_token"], name: "index_providers_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_providers_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_providers_on_invited_by"
    t.index ["reset_password_token"], name: "index_providers_on_reset_password_token", unique: true
    t.index ["work_id"], name: "index_providers_on_work_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "tel"
    t.string "bank"
    t.string "branch"
    t.string "account_type"
    t.string "account_no"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.text "career"
    t.text "appeal"
    t.datetime "deleted_at"
    t.boolean "scout"
    t.boolean "headhunt"
    t.string "remember_token"
    t.string "invitername"
    t.string "inviteremail"
    t.string "invitertel"
    t.string "line_id"
    t.string "residence"
    t.date "birth_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_providers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "work_id"
    t.index ["work_id"], name: "index_work_providers_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "reward"
    t.text "pcontent"
    t.string "rday"
    t.text "rcontent"
    t.text "area"
    t.text "appeal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "link"
    t.string "images"
    t.integer "provider_id"
    t.string "company_name"
    t.string "sheet_id"
    t.string "google_account"
    t.string "work_overview"
    t.string "form_overview"
    t.string "form_detail"
    t.string "display_order"
    t.integer "position"
    t.string "remove_images"
    t.string "id_second"
    t.string "id_third"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "details", "users"
  add_foreign_key "details", "works"
  add_foreign_key "introductions", "users"
  add_foreign_key "introductions", "works"
  add_foreign_key "providers", "works"
  add_foreign_key "work_providers", "works"
end
