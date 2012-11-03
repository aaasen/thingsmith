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

ActiveRecord::Schema.define(:version => 20121021223003) do

  create_table "emails", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "group"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "users_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "color"
    t.string   "logo_url"
    t.string   "twitter_handle"
    t.string   "twitter_url"
    t.string   "facebook_url"
    t.string   "email_address"
  end

  create_table "merchants", :force => true do |t|
    t.string   "name"
    t.string   "logo_url"
    t.string   "affiliate_link"
    t.float    "percent"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
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
    t.integer  "group_id"
  end

end
