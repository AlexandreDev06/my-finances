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

ActiveRecord::Schema.define(version: 2021_10_03_044427) do

  create_table "credits", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "total"
    t.date "payment_at"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "flux"
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
    t.integer "flux"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "future_goals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "total"
    t.integer "priority"
    t.date "ending_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.float "balance"
    t.float "savings"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "credits", "users"
  add_foreign_key "expenses", "users"
end
