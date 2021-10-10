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

ActiveRecord::Schema.define(version: 2021_10_10_191249) do

  create_table "buys", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "giver_id"
    t.bigint "taker_id"
    t.bigint "wallet_id"
    t.bigint "statement_id"
    t.integer "quantity", null: false
    t.integer "unit_price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["giver_id"], name: "index_buys_on_giver_id"
    t.index ["statement_id"], name: "index_buys_on_statement_id"
    t.index ["taker_id"], name: "index_buys_on_taker_id"
    t.index ["wallet_id"], name: "index_buys_on_wallet_id"
  end

  create_table "messages", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "buy_id"
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.text "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buy_id"], name: "index_messages_on_buy_id"
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "purchases", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "wallet_id"
    t.bigint "statement_id"
    t.integer "quantity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["statement_id"], name: "index_purchases_on_statement_id"
    t.index ["wallet_id"], name: "index_purchases_on_wallet_id"
  end

  create_table "statements", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "wallet_id"
    t.integer "plus"
    t.integer "minus"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wallet_id"], name: "index_statements_on_wallet_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.integer "gender_id", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_kana", null: false
    t.string "first_kana", null: false
    t.date "birthday", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wallets", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "stock_quantity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "buys", "statements"
  add_foreign_key "buys", "users", column: "giver_id"
  add_foreign_key "buys", "users", column: "taker_id"
  add_foreign_key "buys", "wallets"
  add_foreign_key "messages", "buys"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "purchases", "statements"
  add_foreign_key "purchases", "wallets"
  add_foreign_key "statements", "wallets"
  add_foreign_key "wallets", "users"
end
