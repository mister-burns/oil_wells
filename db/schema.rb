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

ActiveRecord::Schema.define(version: 20140223171434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lease_operators", force: true do |t|
    t.integer  "lease_id"
    t.integer  "operator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lease_wells", force: true do |t|
    t.integer  "lease_id"
    t.integer  "well_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leases", force: true do |t|
    t.string   "name"
    t.integer  "lease_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operator_wells", force: true do |t|
    t.integer  "operator_id"
    t.integer  "well_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operators", force: true do |t|
    t.string   "name"
    t.integer  "operator_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wells", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "oil_24_hour"
    t.float    "gas_24_hour"
    t.float    "water_24_hour"
    t.integer  "drilling_permit_number"
    t.date     "submit_date"
    t.string   "well_number"
    t.string   "status"
    t.string   "packet_type"
    t.integer  "tracking_number"
    t.integer  "api_number",             limit: 8
  end

end
