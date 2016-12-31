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

ActiveRecord::Schema.define(version: 20161230184003) do

  create_table "game_territories", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "territory_id"
    t.integer  "player_id"
    t.integer  "troops",       default: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["game_id"], name: "index_game_territories_on_game_id"
    t.index ["player_id"], name: "index_game_territories_on_player_id"
    t.index ["territory_id"], name: "index_game_territories_on_territory_id"
  end

  create_table "games", force: :cascade do |t|
    t.string   "nick_name"
    t.integer  "num_of_players"
    t.integer  "current_player"
    t.boolean  "random_select"
    t.boolean  "wins_tie"
    t.integer  "num_of_cards"
    t.integer  "card_set_value", default: 4
    t.string   "phase",          default: "initialTroops"
    t.boolean  "active",         default: false
    t.boolean  "play_started",   default: false
    t.integer  "next_card",      default: 1
    t.integer  "round",          default: 1
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["active"], name: "index_games_on_active"
    t.index ["current_player"], name: "index_games_on_current_player"
  end

  create_table "players", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.boolean "admin",             default: false
    t.boolean "active",            default: true
    t.integer "reserves",          default: 0
    t.integer "temp_reserves",     default: 0
    t.text    "cards"
    t.boolean "can_turn_in_cards", default: false
    t.boolean "getsACard",         default: false
    t.boolean "mustTurnInCards",   default: false
    t.integer "icon"
    t.index ["active"], name: "index_players_on_active"
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "shuffled_cards", force: :cascade do |t|
    t.integer "game_id"
    t.integer "card1"
    t.integer "card2"
    t.integer "card3"
    t.integer "card4"
    t.integer "card5"
    t.integer "card6"
    t.integer "card7"
    t.integer "card8"
    t.integer "card9"
    t.integer "card10"
    t.integer "card11"
    t.integer "card12"
    t.integer "card13"
    t.integer "card14"
    t.integer "card15"
    t.integer "card16"
    t.integer "card17"
    t.integer "card18"
    t.integer "card19"
    t.integer "card20"
    t.integer "card21"
    t.integer "card22"
    t.integer "card23"
    t.integer "card24"
    t.integer "card25"
    t.integer "card26"
    t.integer "card27"
    t.integer "card28"
    t.integer "card29"
    t.integer "card30"
    t.integer "card31"
    t.integer "card32"
    t.integer "card33"
    t.integer "card34"
    t.integer "card35"
    t.integer "card36"
    t.integer "card37"
    t.integer "card38"
    t.integer "card39"
    t.integer "card40"
    t.integer "card41"
    t.integer "card42"
    t.integer "card43"
    t.integer "card44"
    t.integer "card45"
    t.integer "card46"
    t.integer "card47"
    t.integer "card48"
    t.integer "card49"
    t.integer "card50"
    t.integer "card51"
    t.integer "card52"
    t.integer "card53"
    t.integer "card54"
    t.integer "card55"
    t.integer "card56"
    t.integer "card57"
    t.integer "card58"
    t.integer "card59"
    t.integer "card60"
    t.integer "card61"
    t.integer "card62"
    t.integer "card63"
    t.integer "card64"
    t.integer "card65"
    t.integer "card66"
    t.integer "card67"
    t.integer "card68"
    t.integer "card69"
    t.integer "card70"
    t.integer "card71"
    t.integer "card72"
    t.integer "card73"
    t.integer "card74"
    t.integer "card75"
    t.integer "card76"
    t.integer "card77"
    t.integer "card78"
    t.integer "card79"
    t.integer "card80"
    t.integer "card81"
    t.integer "card82"
    t.integer "card83"
    t.integer "card84"
    t.integer "card85"
    t.integer "card86"
    t.integer "card87"
    t.integer "card88"
    t.integer "card89"
    t.integer "card90"
    t.integer "card91"
    t.integer "card92"
    t.index ["game_id"], name: "index_shuffled_cards_on_game_id"
  end

  create_table "sorted_cards", force: :cascade do |t|
    t.string  "name"
    t.integer "case"
    t.integer "number"
  end

  create_table "territories", force: :cascade do |t|
    t.string "name"
    t.string "group"
    t.text   "borders"
    t.index ["group"], name: "index_territories_on_group"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

end
