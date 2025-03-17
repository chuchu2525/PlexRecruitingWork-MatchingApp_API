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

ActiveRecord::Schema[8.0].define(version: 2025_03_15_150544) do
  create_table "applications", force: :cascade do |t|
    t.integer "student_profile_id", null: false
    t.integer "recruitment_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruitment_id"], name: "index_applications_on_recruitment_id"
    t.index ["student_profile_id"], name: "index_applications_on_student_profile_id"
  end

  create_table "company_profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "company_overview"
    t.text "business_description"
    t.text "job_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_company_profiles_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "application_id", null: false
    t.string "sender_type"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_messages_on_application_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.integer "company_profile_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_profile_id"], name: "index_recruitments_on_company_profile_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "grade"
    t.string "university"
    t.string "faculty"
    t.text "self_introduction"
    t.text "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_student_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "applications", "recruitments"
  add_foreign_key "applications", "student_profiles"
  add_foreign_key "company_profiles", "users"
  add_foreign_key "messages", "applications"
  add_foreign_key "recruitments", "company_profiles"
  add_foreign_key "student_profiles", "users"
end
