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

ActiveRecord::Schema.define(version: 20161119174918) do

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

  create_table "territories", force: :cascade do |t|
    t.string "name"
    t.text   "borders"
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
