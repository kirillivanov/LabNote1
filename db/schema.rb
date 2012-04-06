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

ActiveRecord::Schema.define(:version => 20120406183559) do

  create_table "assignments", :force => true do |t|
    t.integer  "researcher_id"
    t.integer  "project_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "assignments", ["project_id", "researcher_id"], :name => "index_assignments_on_project_id_and_researcher_id", :unique => true
  add_index "assignments", ["project_id"], :name => "index_assignments_on_project_id"
  add_index "assignments", ["researcher_id"], :name => "index_assignments_on_researcher_id"

  create_table "experiments", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "researcher_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "notebooks", :force => true do |t|
    t.integer  "researcher_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "notes", :force => true do |t|
    t.text     "text"
    t.integer  "experiment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "attachment"
    t.integer  "page_id"
  end

  create_table "pages", :force => true do |t|
    t.integer  "notebook_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "researchers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "researchers", ["email"], :name => "index_researchers_on_email", :unique => true
  add_index "researchers", ["reset_password_token"], :name => "index_researchers_on_reset_password_token", :unique => true

end
