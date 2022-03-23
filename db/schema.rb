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

ActiveRecord::Schema.define(version: 2022_03_23_231917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ski_makers", force: :cascade do |t|
    t.string "company_name"
    t.integer "years_active"
    t.boolean "makes_snowboards"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skis", force: :cascade do |t|
    t.bigint "ski_maker_id"
    t.string "model"
    t.string "ski_type"
    t.integer "longest_offered_cm"
    t.boolean "symmetrical"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ski_maker_id"], name: "index_skis_on_ski_maker_id"
  end

  add_foreign_key "skis", "ski_makers"
end
