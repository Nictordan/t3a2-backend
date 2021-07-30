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

ActiveRecord::Schema.define(version: 2021_07_28_180850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "note_id"
    t.index ["note_id"], name: "index_comments_on_note_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street"
    t.string "suburb"
    t.string "city"
    t.string "state"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pin_id"
    t.index ["pin_id"], name: "index_locations_on_pin_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pin_id"
    t.index ["pin_id"], name: "index_notes_on_pin_id"
  end

  create_table "pin_families", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pin_id"
    t.index ["pin_id"], name: "index_pin_families_on_pin_id"
  end

  create_table "pins", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pin_family_id"
    t.index ["pin_family_id"], name: "index_pins_on_pin_family_id"
  end

  add_foreign_key "comments", "notes"
  add_foreign_key "locations", "pins"
  add_foreign_key "notes", "pins"
  add_foreign_key "pin_families", "pins"
  add_foreign_key "pins", "pin_families"
end