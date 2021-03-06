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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121108024515) do

  create_table "bids", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.float    "amount"
    t.string   "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "days"
    t.boolean  "accepted"
  end

  create_table "emails", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.float    "dimension_x"
    t.float    "dimension_y"
    t.integer  "material_id"
    t.date     "completion_date"
    t.float    "budget"
    t.string   "file_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "material"
    t.integer  "user_id"
    t.boolean  "complete"
  end

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider",                 :null => false
    t.string   "uid",                      :null => false
    t.string   "email",                    :null => false
    t.integer  "created",     :limit => 8
    t.string   "username"
    t.boolean  "verified"
    t.boolean  "admin"
    t.string   "referred_by"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.text     "bio"
    t.string   "city"
  end

end
