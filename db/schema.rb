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

ActiveRecord::Schema.define(:version => 20130421180940) do

  create_table "comments", :force => true do |t|
    t.integer  "discussable_id"
    t.string   "discussable_type"
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "username"
  end

  add_index "comments", ["discussable_id"], :name => "index_comments_on_discussable_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "gmail"
    t.string   "gpassword"
    t.string   "drive_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spreadsheet_comments", :force => true do |t|
    t.integer  "employee_id"
    t.string   "username"
    t.text     "content"
    t.integer  "commented_on"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
