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

ActiveRecord::Schema.define(version: 2019_07_12_170949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dimensions", force: :cascade do |t|
    t.bigint "name_id"
    t.bigint "description_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "actions_id"
    t.index ["actions_id"], name: "index_dimensions_on_actions_id"
    t.index ["description_id"], name: "index_dimensions_on_description_id"
    t.index ["name_id"], name: "index_dimensions_on_name_id"
  end

  create_table "interview_questions", force: :cascade do |t|
    t.bigint "interview_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interview_id"], name: "index_interview_questions_on_interview_id"
    t.index ["question_id"], name: "index_interview_questions_on_question_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "name"
    t.text "dimentions"
    t.text "motivational_questions"
    t.string "company"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_interviews_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "code"
    t.bigint "translation_id"
    t.bigint "translation_b_id"
    t.boolean "mandatory", default: false
    t.bigint "dimension_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dimension_id"], name: "index_questions_on_dimension_id"
    t.index ["translation_b_id"], name: "index_questions_on_translation_b_id"
    t.index ["translation_id"], name: "index_questions_on_translation_id"
  end

  create_table "results", force: :cascade do |t|
    t.string "position"
    t.text "answers"
    t.text "motivational_competence"
    t.string "base_salary"
    t.string "benefits"
    t.string "salary_expectations"
    t.text "geographical_areas"
    t.string "company"
    t.boolean "editable"
    t.bigint "user_id"
    t.bigint "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_results_on_candidate_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "translations", force: :cascade do |t|
    t.text "english"
    t.text "spanish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "name", default: "", null: false
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: true
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "dimensions", "translations", column: "actions_id"
  add_foreign_key "dimensions", "translations", column: "description_id"
  add_foreign_key "dimensions", "translations", column: "name_id"
  add_foreign_key "interview_questions", "interviews"
  add_foreign_key "interview_questions", "questions"
  add_foreign_key "interviews", "users"
  add_foreign_key "questions", "dimensions"
  add_foreign_key "questions", "translations"
  add_foreign_key "questions", "translations", column: "translation_b_id"
  add_foreign_key "results", "candidates"
  add_foreign_key "results", "users"
end
