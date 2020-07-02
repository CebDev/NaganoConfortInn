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

ActiveRecord::Schema.define(:version => 20200702181930) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "first_name"
    t.text     "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "reservation_rooms", :force => true do |t|
    t.integer  "reservation_id"
    t.integer  "room_id"
    t.date     "date_from"
    t.date     "date_to"
    t.integer  "room_pricing_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "customer_id"
    t.text     "comment"
    t.float    "total_price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "room_pictures", :force => true do |t|
    t.integer  "room_id"
    t.string   "file_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "room_pricings", :force => true do |t|
    t.string   "title"
    t.integer  "room_type_id"
    t.integer  "room_view_id"
    t.float    "price_open_day"
    t.float    "price_week_end"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "archived_at"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "room_types", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "room_views", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rooms", :force => true do |t|
    t.integer  "number"
    t.integer  "floor"
    t.integer  "room_type_id"
    t.integer  "room_view_id"
    t.integer  "capacity"
    t.string   "status",       :default => "Ready"
    t.datetime "archived_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "company_name"
    t.text     "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "phone_number"
    t.string   "email"
    t.float    "tps"
    t.float    "tvq"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
