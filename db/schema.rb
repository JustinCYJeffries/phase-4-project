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

ActiveRecord::Schema.define(version: 2022_11_28_193216) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "helpme_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["helpme_id"], name: "index_comments_on_helpme_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "imageURL"
    t.string "title"
    t.string "description"
    t.string "releaseDate"
    t.string "publisher"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "helpmes", force: :cascade do |t|
    t.string "question"
    t.integer "party_game_game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["party_game_game_id"], name: "index_helpmes_on_party_game_game_id"
  end

  create_table "party_game_games", force: :cascade do |t|
    t.integer "party_game_id", null: false
    t.integer "game_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_party_game_games_on_game_id"
    t.index ["party_game_id"], name: "index_party_game_games_on_party_game_id"
  end

  create_table "party_game_users", force: :cascade do |t|
    t.boolean "isAdmin"
    t.integer "user_id", null: false
    t.integer "party_game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["party_game_id"], name: "index_party_game_users_on_party_game_id"
    t.index ["user_id"], name: "index_party_game_users_on_user_id"
  end

  create_table "party_games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trackers", force: :cascade do |t|
    t.integer "party_game_game_id", null: false
    t.boolean "complete"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["party_game_game_id"], name: "index_trackers_on_party_game_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "helpmes"
  add_foreign_key "comments", "users"
  add_foreign_key "party_game_games", "games"
  add_foreign_key "party_game_games", "party_games"
  add_foreign_key "party_game_users", "party_games"
  add_foreign_key "party_game_users", "users"
  add_foreign_key "trackers", "party_game_games"
end
