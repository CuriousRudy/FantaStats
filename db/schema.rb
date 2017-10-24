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

ActiveRecord::Schema.define(version: 5) do

  create_table "fantasy_teams", force: :cascade do |t|
    t.string "name"
    t.string "owner"
  end

  create_table "games", force: :cascade do |t|
    t.integer "game_id"
    t.integer "season"
  end

  create_table "players", force: :cascade do |t|
    t.integer "player_id"
    t.string "full_name"
    t.string "team_id"
    t.string "position"
    t.string "status"
    t.integer "fantasy_id"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "fumbles"
    t.integer "pass_tds"
    t.integer "pass_twopts"
    t.integer "pass_yds"
    t.integer "pass_int"
    t.integer "rec_yds"
    t.integer "rec_tds"
    t.integer "rec_twopts"
    t.integer "rush_yds"
    t.integer "rush_tds"
    t.integer "rush_twopts"
    t.integer "game_id"
    t.integer "player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "abbrev"
    t.string "city"
    t.string "name"
    t.boolean "active"
  end

end
