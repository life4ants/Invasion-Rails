# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161123180457) do

  create_table "games", force: :cascade do |t|
    t.integer  "turn_index"
    t.text     "settings"
    t.integer  "card_set_value", default: 4
    t.string   "phase"
    t.boolean  "active"
    t.boolean  "play_started"
    t.integer  "next_card"
    t.integer  "round"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "owners", force: :cascade do |t|
    t.integer "game_id"
    t.integer "terrOwner1"
    t.integer "terrOwner2"
    t.integer "terrOwner3"
    t.integer "terrOwner4"
    t.integer "terrOwner5"
    t.integer "terrOwner6"
    t.integer "terrOwner7"
    t.integer "terrOwner8"
    t.integer "terrOwner9"
    t.integer "terrOwner10"
    t.integer "terrOwner11"
    t.integer "terrOwner12"
    t.integer "terrOwner13"
    t.integer "terrOwner14"
    t.integer "terrOwner15"
    t.integer "terrOwner16"
    t.integer "terrOwner17"
    t.integer "terrOwner18"
    t.integer "terrOwner19"
    t.integer "terrOwner20"
    t.integer "terrOwner21"
    t.integer "terrOwner22"
    t.integer "terrOwner23"
    t.integer "terrOwner24"
    t.integer "terrOwner25"
    t.integer "terrOwner26"
    t.integer "terrOwner27"
    t.integer "terrOwner28"
    t.integer "terrOwner29"
    t.integer "terrOwner30"
    t.integer "terrOwner31"
    t.integer "terrOwner32"
    t.integer "terrOwner33"
    t.integer "terrOwner34"
    t.integer "terrOwner35"
    t.integer "terrOwner36"
    t.integer "terrOwner37"
    t.integer "terrOwner38"
    t.integer "terrOwner39"
    t.integer "terrOwner40"
    t.integer "terrOwner41"
    t.integer "terrOwner42"
    t.integer "terrOwner43"
    t.integer "terrOwner44"
    t.integer "terrOwner45"
    t.integer "terrOwner46"
    t.integer "terrOwner47"
    t.integer "terrOwner48"
    t.integer "terrOwner49"
    t.integer "terrOwner50"
    t.integer "terrOwner51"
    t.integer "terrOwner52"
    t.integer "terrOwner53"
    t.integer "terrOwner54"
    t.integer "terrOwner55"
    t.integer "terrOwner56"
    t.integer "terrOwner57"
    t.integer "terrOwner58"
    t.integer "terrOwner59"
    t.integer "terrOwner60"
    t.integer "terrOwner61"
    t.integer "terrOwner62"
    t.integer "terrOwner63"
    t.integer "terrOwner64"
    t.integer "terrOwner65"
    t.integer "terrOwner66"
    t.integer "terrOwner67"
    t.integer "terrOwner68"
    t.integer "terrOwner69"
    t.integer "terrOwner70"
    t.integer "terrOwner71"
    t.integer "terrOwner72"
    t.integer "terrOwner73"
    t.integer "terrOwner74"
    t.integer "terrOwner75"
    t.integer "terrOwner76"
    t.integer "terrOwner77"
    t.integer "terrOwner78"
    t.integer "terrOwner79"
    t.integer "terrOwner80"
    t.integer "terrOwner81"
    t.integer "terrOwner82"
    t.integer "terrOwner83"
    t.integer "terrOwner84"
    t.integer "terrOwner85"
    t.integer "terrOwner86"
    t.integer "terrOwner87"
    t.integer "terrOwner88"
    t.integer "terrOwner89"
    t.integer "terrOwner90"
  end

  create_table "players", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.boolean "admin",             default: false
    t.integer "reserves",          default: 0
    t.integer "temp_reserves",     default: 0
    t.text    "cards"
    t.boolean "can_turn_in_cards", default: false
    t.boolean "getsACard",         default: false
    t.boolean "mustTurnInCards",   default: false
    t.integer "numOfPasses",       default: 0
    t.integer "sets_turned_in",    default: 0
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id"
  add_index "players", ["user_id"], name: "index_players_on_user_id"

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
  end

  add_index "shuffled_cards", ["game_id"], name: "index_shuffled_cards_on_game_id"

  create_table "sorted_cards", force: :cascade do |t|
    t.string  "name"
    t.integer "case"
    t.integer "number"
  end

  create_table "territories", force: :cascade do |t|
    t.string "name"
    t.text   "borders"
  end

  create_table "territory_borders", force: :cascade do |t|
    t.string "name"
    t.text   "borders"
  end

  create_table "territory_owners", force: :cascade do |t|
    t.integer "game_id"
    t.integer "terr1Owner"
    t.integer "terr2Owner"
    t.integer "terr3Owner"
    t.integer "terr4Owner"
    t.integer "terr5Owner"
    t.integer "terr6Owner"
    t.integer "terr7Owner"
    t.integer "terr8Owner"
    t.integer "terr9Owner"
    t.integer "terr10Owner"
    t.integer "terr11Owner"
    t.integer "terr12Owner"
    t.integer "terr13Owner"
    t.integer "terr14Owner"
    t.integer "terr15Owner"
    t.integer "terr16Owner"
    t.integer "terr17Owner"
    t.integer "terr18Owner"
    t.integer "terr19Owner"
    t.integer "terr20Owner"
    t.integer "terr21Owner"
    t.integer "terr22Owner"
    t.integer "terr23Owner"
    t.integer "terr24Owner"
    t.integer "terr25Owner"
    t.integer "terr26Owner"
    t.integer "terr27Owner"
    t.integer "terr28Owner"
    t.integer "terr29Owner"
    t.integer "terr30Owner"
    t.integer "terr31Owner"
    t.integer "terr32Owner"
    t.integer "terr33Owner"
    t.integer "terr34Owner"
    t.integer "terr35Owner"
    t.integer "terr36Owner"
    t.integer "terr37Owner"
    t.integer "terr38Owner"
    t.integer "terr39Owner"
    t.integer "terr40Owner"
    t.integer "terr41Owner"
    t.integer "terr42Owner"
    t.integer "terr43Owner"
    t.integer "terr44Owner"
    t.integer "terr45Owner"
    t.integer "terr46Owner"
    t.integer "terr47Owner"
    t.integer "terr48Owner"
    t.integer "terr49Owner"
    t.integer "terr50Owner"
    t.integer "terr51Owner"
    t.integer "terr52Owner"
    t.integer "terr53Owner"
    t.integer "terr54Owner"
    t.integer "terr55Owner"
    t.integer "terr56Owner"
    t.integer "terr57Owner"
    t.integer "terr58Owner"
    t.integer "terr59Owner"
    t.integer "terr60Owner"
    t.integer "terr61Owner"
    t.integer "terr62Owner"
    t.integer "terr63Owner"
    t.integer "terr64Owner"
    t.integer "terr65Owner"
    t.integer "terr66Owner"
    t.integer "terr67Owner"
    t.integer "terr68Owner"
    t.integer "terr69Owner"
    t.integer "terr70Owner"
    t.integer "terr71Owner"
    t.integer "terr72Owner"
    t.integer "terr73Owner"
    t.integer "terr74Owner"
    t.integer "terr75Owner"
    t.integer "terr76Owner"
    t.integer "terr77Owner"
    t.integer "terr78Owner"
    t.integer "terr79Owner"
    t.integer "terr80Owner"
    t.integer "terr81Owner"
    t.integer "terr82Owner"
    t.integer "terr83Owner"
    t.integer "terr84Owner"
    t.integer "terr85Owner"
    t.integer "terr86Owner"
    t.integer "terr87Owner"
    t.integer "terr88Owner"
    t.integer "terr89Owner"
    t.integer "terr90Owner"
  end

  add_index "territory_owners", ["game_id"], name: "index_territory_owners_on_game_id"

  create_table "territory_reserves", force: :cascade do |t|
    t.integer "game_id"
    t.integer "terr1Reserves",  default: 0
    t.integer "terr2Reserves",  default: 0
    t.integer "terr3Reserves",  default: 0
    t.integer "terr4Reserves",  default: 0
    t.integer "terr5Reserves",  default: 0
    t.integer "terr6Reserves",  default: 0
    t.integer "terr7Reserves",  default: 0
    t.integer "terr8Reserves",  default: 0
    t.integer "terr9Reserves",  default: 0
    t.integer "terr10Reserves", default: 0
    t.integer "terr11Reserves", default: 0
    t.integer "terr12Reserves", default: 0
    t.integer "terr13Reserves", default: 0
    t.integer "terr14Reserves", default: 0
    t.integer "terr15Reserves", default: 0
    t.integer "terr16Reserves", default: 0
    t.integer "terr17Reserves", default: 0
    t.integer "terr18Reserves", default: 0
    t.integer "terr19Reserves", default: 0
    t.integer "terr20Reserves", default: 0
    t.integer "terr21Reserves", default: 0
    t.integer "terr22Reserves", default: 0
    t.integer "terr23Reserves", default: 0
    t.integer "terr24Reserves", default: 0
    t.integer "terr25Reserves", default: 0
    t.integer "terr26Reserves", default: 0
    t.integer "terr27Reserves", default: 0
    t.integer "terr28Reserves", default: 0
    t.integer "terr29Reserves", default: 0
    t.integer "terr30Reserves", default: 0
    t.integer "terr31Reserves", default: 0
    t.integer "terr32Reserves", default: 0
    t.integer "terr33Reserves", default: 0
    t.integer "terr34Reserves", default: 0
    t.integer "terr35Reserves", default: 0
    t.integer "terr36Reserves", default: 0
    t.integer "terr37Reserves", default: 0
    t.integer "terr38Reserves", default: 0
    t.integer "terr39Reserves", default: 0
    t.integer "terr40Reserves", default: 0
    t.integer "terr41Reserves", default: 0
    t.integer "terr42Reserves", default: 0
    t.integer "terr43Reserves", default: 0
    t.integer "terr44Reserves", default: 0
    t.integer "terr45Reserves", default: 0
    t.integer "terr46Reserves", default: 0
    t.integer "terr47Reserves", default: 0
    t.integer "terr48Reserves", default: 0
    t.integer "terr49Reserves", default: 0
    t.integer "terr50Reserves", default: 0
    t.integer "terr51Reserves", default: 0
    t.integer "terr52Reserves", default: 0
    t.integer "terr53Reserves", default: 0
    t.integer "terr54Reserves", default: 0
    t.integer "terr55Reserves", default: 0
    t.integer "terr56Reserves", default: 0
    t.integer "terr57Reserves", default: 0
    t.integer "terr58Reserves", default: 0
    t.integer "terr59Reserves", default: 0
    t.integer "terr60Reserves", default: 0
    t.integer "terr61Reserves", default: 0
    t.integer "terr62Reserves", default: 0
    t.integer "terr63Reserves", default: 0
    t.integer "terr64Reserves", default: 0
    t.integer "terr65Reserves", default: 0
    t.integer "terr66Reserves", default: 0
    t.integer "terr67Reserves", default: 0
    t.integer "terr68Reserves", default: 0
    t.integer "terr69Reserves", default: 0
    t.integer "terr70Reserves", default: 0
    t.integer "terr71Reserves", default: 0
    t.integer "terr72Reserves", default: 0
    t.integer "terr73Reserves", default: 0
    t.integer "terr74Reserves", default: 0
    t.integer "terr75Reserves", default: 0
    t.integer "terr76Reserves", default: 0
    t.integer "terr77Reserves", default: 0
    t.integer "terr78Reserves", default: 0
    t.integer "terr79Reserves", default: 0
    t.integer "terr80Reserves", default: 0
    t.integer "terr81Reserves", default: 0
    t.integer "terr82Reserves", default: 0
    t.integer "terr83Reserves", default: 0
    t.integer "terr84Reserves", default: 0
    t.integer "terr85Reserves", default: 0
    t.integer "terr86Reserves", default: 0
    t.integer "terr87Reserves", default: 0
    t.integer "terr88Reserves", default: 0
    t.integer "terr89Reserves", default: 0
    t.integer "terr90Reserves", default: 0
  end

  add_index "territory_reserves", ["game_id"], name: "index_territory_reserves_on_game_id"

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
