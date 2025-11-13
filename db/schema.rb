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

ActiveRecord::Schema[8.1].define(version: 2025_11_13_182627) do
  create_table "armies", force: :cascade do |t|
    t.integer "civilization_id", null: false
    t.integer "coins", default: 1000, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["civilization_id"], name: "index_armies_on_civilization_id"
  end

  create_table "battles", force: :cascade do |t|
    t.integer "attacker_army_id", null: false
    t.datetime "created_at", null: false
    t.integer "defender_army_id", null: false
    t.string "result", null: false
    t.datetime "updated_at", null: false
    t.integer "winner_id"
    t.integer "winner_prize", null: false
    t.index ["attacker_army_id"], name: "index_battles_on_attacker_army_id"
    t.index ["defender_army_id"], name: "index_battles_on_defender_army_id"
    t.index ["winner_id"], name: "index_battles_on_winner_id"
  end

  create_table "civilization_unit_types", force: :cascade do |t|
    t.integer "amount", null: false
    t.integer "civilization_id", null: false
    t.datetime "created_at", null: false
    t.integer "unit_type_id", null: false
    t.datetime "updated_at", null: false
    t.index ["civilization_id"], name: "index_civilization_unit_types_on_civilization_id"
    t.index ["unit_type_id"], name: "index_civilization_unit_types_on_unit_type_id"
  end

  create_table "civilizations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evolutions", force: :cascade do |t|
    t.integer "cost", null: false
    t.datetime "created_at", null: false
    t.integer "final_unit_type_id", null: false
    t.integer "init_unit_type_id", null: false
    t.datetime "updated_at", null: false
    t.index ["final_unit_type_id"], name: "index_evolutions_on_final_unit_type_id"
    t.index ["init_unit_type_id"], name: "index_evolutions_on_init_unit_type_id"
  end

  create_table "evolutions_histories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "evolution_id", null: false
    t.integer "unit_id", null: false
    t.datetime "updated_at", null: false
    t.index ["evolution_id"], name: "index_evolutions_histories_on_evolution_id"
    t.index ["unit_id"], name: "index_evolutions_histories_on_unit_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.integer "cost", null: false
    t.datetime "created_at", null: false
    t.integer "points", null: false
    t.integer "unit_type_id", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_type_id"], name: "index_trainings_on_unit_type_id"
  end

  create_table "trainings_histories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "training_id", null: false
    t.integer "unit_id", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_trainings_histories_on_training_id"
    t.index ["unit_id"], name: "index_trainings_histories_on_unit_id"
  end

  create_table "unit_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.integer "army_id", null: false
    t.datetime "created_at", null: false
    t.integer "force_points", null: false
    t.integer "unit_type_id", null: false
    t.datetime "updated_at", null: false
    t.integer "years_of_life", null: false
    t.index ["army_id"], name: "index_units_on_army_id"
    t.index ["unit_type_id"], name: "index_units_on_unit_type_id"
  end

  add_foreign_key "armies", "civilizations"
  add_foreign_key "battles", "armies", column: "attacker_army_id"
  add_foreign_key "battles", "armies", column: "defender_army_id"
  add_foreign_key "battles", "armies", column: "winner_id"
  add_foreign_key "civilization_unit_types", "civilizations"
  add_foreign_key "civilization_unit_types", "unit_types"
  add_foreign_key "evolutions", "unit_types", column: "final_unit_type_id"
  add_foreign_key "evolutions", "unit_types", column: "init_unit_type_id"
  add_foreign_key "evolutions_histories", "evolutions"
  add_foreign_key "evolutions_histories", "units"
  add_foreign_key "trainings", "unit_types"
  add_foreign_key "trainings_histories", "trainings"
  add_foreign_key "trainings_histories", "units"
  add_foreign_key "units", "armies"
  add_foreign_key "units", "unit_types"
end
