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

ActiveRecord::Schema.define(:version => 20130325022207) do

  create_table "business_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "business_types_locations", :id => false, :force => true do |t|
    t.integer "business_type_id"
    t.integer "location_id"
  end

  add_index "business_types_locations", ["business_type_id"], :name => "index_business_types_locations_on_business_type_id"
  add_index "business_types_locations", ["location_id"], :name => "index_business_types_locations_on_location_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "languages_locations", :id => false, :force => true do |t|
    t.integer "language_id"
    t.integer "location_id"
  end

  add_index "languages_locations", ["language_id"], :name => "index_languages_locations_on_language_id"
  add_index "languages_locations", ["location_id"], :name => "index_languages_locations_on_location_id"

  create_table "languages_organizations", :id => false, :force => true do |t|
    t.integer "language_id"
    t.integer "organization_id"
  end

  add_index "languages_organizations", ["language_id"], :name => "index_languages_organizations_on_language_id"
  add_index "languages_organizations", ["organization_id"], :name => "index_languages_organizations_on_organization_id"

  create_table "location_service_delivery_options", :force => true do |t|
    t.integer  "location_id"
    t.integer  "service_delivery_option_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "zipcode"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.text     "hours"
    t.text     "directions"
    t.boolean  "wheelchair_accessible",      :default => false
    t.boolean  "bart_accessible",            :default => false
    t.boolean  "muni_bus_accessible",        :default => false
    t.boolean  "muni_train_accessible",      :default => false
    t.boolean  "ac_bus_accessible",          :default => false
    t.boolean  "free_parking",               :default => false
    t.boolean  "parking_meters",             :default => false
    t.boolean  "paid_parking_lot",           :default => false
    t.boolean  "free_street_parking",        :default => false
    t.string   "public_transportation_stop"
    t.string   "parking_fees"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.boolean  "gmaps"
    t.integer  "location_id"
    t.string   "delivery_method"
  end

  add_index "locations", ["organization_id"], :name => "index_locations_on_organization_id"

  create_table "locations_services", :id => false, :force => true do |t|
    t.integer "location_id"
    t.integer "service_id"
  end

  add_index "locations_services", ["location_id"], :name => "index_locations_services_on_location_id"
  add_index "locations_services", ["service_id"], :name => "index_locations_services_on_service_id"

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "zipcode"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "phone"
    t.string   "website"
    t.string   "email"
    t.text     "population"
    t.text     "goal_1"
    t.text     "goal_2"
    t.text     "goal_3"
    t.text     "goal_4"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "gmaps"
    t.string   "contact"
  end

  create_table "organizations_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "organization_id"
  end

  add_index "organizations_users", ["organization_id", "user_id"], :name => "index_organizations_users_on_organization_id_and_user_id"
  add_index "organizations_users", ["user_id", "organization_id"], :name => "index_organizations_users_on_user_id_and_organization_id"

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "sort_order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "service_delivery_options", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
    t.integer  "service_id"
    t.string   "delivery"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
