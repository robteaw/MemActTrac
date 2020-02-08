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

ActiveRecord::Schema.define(version: 20180729192836) do

  create_table "calls", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "employee_id"
    t.string "outcome"
    t.date "due_date"
    t.date "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_calls_on_deleted_at"
    t.index ["employee_id"], name: "index_calls_on_employee_id"
    t.index ["location_id"], name: "index_calls_on_location_id"
    t.index ["member_id"], name: "index_calls_on_member_id"
  end

  create_table "class_attendances", force: :cascade do |t|
    t.bigint "class_time_id"
    t.date "date"
    t.integer "attendance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.index ["class_time_id"], name: "index_class_attendances_on_class_time_id"
    t.index ["location_id"], name: "index_class_attendances_on_location_id"
  end

  create_table "class_times", force: :cascade do |t|
    t.string "day_of_week"
    t.time "start_time", precision: 7
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_class_times_on_deleted_at"
    t.index ["location_id"], name: "index_class_times_on_location_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_employees_on_deleted_at"
    t.index ["location_id"], name: "index_employees_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "phone_number"
    t.bigint "membership_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_members_on_deleted_at"
    t.index ["location_id"], name: "index_members_on_location_id"
    t.index ["membership_type_id"], name: "index_members_on_membership_type_id"
  end

  create_table "membership_types", force: :cascade do |t|
    t.string "membership_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_membership_types_on_deleted_at"
    t.index ["location_id"], name: "index_membership_types_on_location_id"
  end

  create_table "prospects", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.boolean "showed"
    t.boolean "signed_up"
    t.date "scheduled_date"
    t.bigint "membership_type_id"
    t.bigint "class_time_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.index ["class_time_id"], name: "index_prospects_on_class_time_id"
    t.index ["location_id"], name: "index_prospects_on_location_id"
    t.index ["membership_type_id"], name: "index_prospects_on_membership_type_id"
  end

  add_foreign_key "calls", "employees"
  add_foreign_key "calls", "locations"
  add_foreign_key "calls", "members"
  add_foreign_key "class_attendances", "class_times"
  add_foreign_key "class_attendances", "locations"
  add_foreign_key "class_times", "locations"
  add_foreign_key "employees", "locations"
  add_foreign_key "members", "locations"
  add_foreign_key "members", "membership_types"
  add_foreign_key "membership_types", "locations"
  add_foreign_key "prospects", "class_times"
  add_foreign_key "prospects", "locations"
  add_foreign_key "prospects", "membership_types"
end
