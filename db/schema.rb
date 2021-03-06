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

ActiveRecord::Schema.define(:version => 20140211183537) do

  create_table "comments", :force => true do |t|
    t.string   "body"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags_topics", :force => true do |t|
    t.integer "tag_id"
    t.integer "topic_id"
  end

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "predecessor"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "rating"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.float    "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
