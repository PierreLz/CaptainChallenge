# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_30_235034) do

  create_table "fights", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "warrior1_id"
    t.integer "warrior2_id"
    t.string "winner"
    t.string "looser"
    t.integer "weapon1_id"
    t.integer "weapon2_id"
  end

  create_table "warriors", force: :cascade do |t|
    t.string "name"
    t.integer "life"
    t.integer "attack_point"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "dexterity_points"
    t.string "picture"
    t.integer "fight_id"
    t.integer "experience", default: 0
    t.integer "win", default: 0
    t.integer "lose", default: 0
    t.index ["fight_id"], name: "index_warriors_on_fight_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "attack_bonus"
    t.integer "life_bonus"
    t.integer "warrior_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["warrior_id"], name: "index_weapons_on_warrior_id"
  end

  add_foreign_key "warriors", "fights"
  add_foreign_key "weapons", "warriors"
end
