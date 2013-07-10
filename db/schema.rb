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

ActiveRecord::Schema.define(:version => 20130709232527) do

  create_table "attendees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "call_id"
    t.date     "meetingdate"
    t.date     "dateinvited"
    t.date     "dateofreminder"
    t.boolean  "accepted"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "calls", :force => true do |t|
    t.string   "subject"
    t.string   "description"
    t.string   "organiser"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "calldetail"
    t.text     "attachment"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "timezone"
    t.string   "password_digest"
    t.datetime "preferredstarttime"
    t.datetime "preferredendtime"
    t.string   "email"
  end

end
