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

ActiveRecord::Schema[7.0].define(version: 2022_04_27_045934) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "transactions", force: :cascade do |t|
    t.string "amount"
    t.bigint "your_stock_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["your_stock_id"], name: "index_transactions_on_your_stock_id"
  end

  create_table "your_amounts", force: :cascade do |t|
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "your_stocks", force: :cascade do |t|
    t.string "stock_symbol"
    t.string "buy_price"
    t.string "sell_price"
    t.boolean "holding", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quatity"
    t.string "up_price"
    t.string "down_price"
  end

  add_foreign_key "transactions", "your_stocks"
end
