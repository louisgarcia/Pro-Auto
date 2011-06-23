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

ActiveRecord::Schema.define(:version => 20110623042510) do

  create_table "add_ons", :force => true do |t|
    t.string   "name"
    t.string   "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_order_id"
    t.integer  "price"
  end

  create_table "cars", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "vin"
    t.string   "stock_number"
    t.integer  "dirty"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "business_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contractors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "email"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "work_order_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contractor_id"
    t.integer  "cost"
  end

  create_table "makes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", :force => true do |t|
    t.integer  "make_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cost"
    t.integer  "price"
  end

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_orders", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "client_id"
    t.string   "stock_number"
    t.integer  "make_id"
    t.integer  "model_id"
    t.string   "year"
    t.string   "vin"
    t.integer  "priority"
    t.integer  "dirty"
    t.text     "notes"
    t.string   "status"
    t.datetime "created"
    t.datetime "received"
    t.datetime "started"
    t.datetime "finished"
    t.datetime "delivered"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
