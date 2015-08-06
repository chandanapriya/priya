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

ActiveRecord::Schema.define(version: 20150806075339) do

  create_table "blood_glucose_readings", force: :cascade do |t|
    t.integer  "reading",    limit: 4
    t.string   "status",     limit: 255
    t.integer  "patient_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "blood_glucose_readings", ["patient_id"], name: "index_blood_glucose_readings_on_patient_id", using: :btree

  create_table "doctors", force: :cascade do |t|
    t.string   "specialization", limit: 255
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "doctors", ["user_id"], name: "index_doctors_on_user_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "type",       limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "doctor_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "patients", ["doctor_id"], name: "index_patients_on_doctor_id", using: :btree
  add_index "patients", ["user_id"], name: "index_patients_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "password",   limit: 255
    t.string   "email",      limit: 255
    t.string   "login_time", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "blood_glucose_readings", "patients"
  add_foreign_key "doctors", "users"
  add_foreign_key "patients", "doctors"
  add_foreign_key "patients", "users"
end
