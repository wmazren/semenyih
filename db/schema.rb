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

ActiveRecord::Schema.define(:version => 20121228213950) do

  create_table "appointments", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "physician_id"
    t.date     "appointment_date"
    t.integer  "organization_id"
    t.string   "state",            :default => "open"
    t.text     "notes"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "appointments", ["organization_id"], :name => "index_appointments_on_organization_id"
  add_index "appointments", ["patient_id"], :name => "index_appointments_on_patient_id"
  add_index "appointments", ["physician_id"], :name => "index_appointments_on_physician_id"

  create_table "organizations", :force => true do |t|
    t.string   "name",          :default => "",   :null => false
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "postcode"
    t.string   "state"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.boolean  "active",        :default => true, :null => false
    t.date     "register_date"
    t.date     "expiry_date"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "organizations", ["name"], :name => "index_organizations_on_name", :unique => true

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "sex"
    t.string   "marital_status"
    t.string   "identification_number"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "postcode"
    t.string   "state"
    t.string   "country"
    t.string   "phone_home"
    t.string   "phone_mobile"
    t.string   "phone_office"
    t.string   "email"
    t.string   "company"
    t.string   "occupation"
    t.string   "blood_type"
    t.text     "notes"
    t.integer  "organization_id"
    t.integer  "parent_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "patients", ["organization_id"], :name => "index_patients_on_organization_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "type"
    t.boolean  "admin"
    t.boolean  "active",                 :default => true, :null => false
    t.integer  "organization_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["organization_id"], :name => "index_users_on_organization_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
