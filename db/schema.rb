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

ActiveRecord::Schema.define(version: 2021_10_23_030646) do

  create_table "credits", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "total"
    t.date "payment_at"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "flux", default: 0
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "total"
    t.date "payment_at"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "flux", default: 0
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "future_goals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "total"
    t.integer "priority"
    t.date "ending_date"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_future_goals_on_user_id"
  end

  create_table "loans", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.string "description"
    t.date "date_payment"
    t.integer "installment"
    t.integer "percentage"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.float "profit"
    t.float "balance"
    t.float "income_tax"
    t.float "iof"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.float "balance"
    t.float "savings"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "credits", "users"
  add_foreign_key "expenses", "users"
  add_foreign_key "future_goals", "users"
  add_foreign_key "loans", "users"
  add_foreign_key "savings", "users"
end
