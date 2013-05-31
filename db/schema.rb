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

ActiveRecord::Schema.define(:version => 20130530205202) do

  create_table "allowed_responses", :force => true do |t|
    t.integer "question_id", :null => false
    t.string  "value",       :null => false
  end

  create_table "polls", :force => true do |t|
    t.integer "creator_id", :null => false
    t.string  "name"
  end

  create_table "questions", :force => true do |t|
    t.integer "poll_id", :null => false
    t.text    "body",    :null => false
  end

  create_table "responses", :force => true do |t|
    t.integer "allowed_response_id", :null => false
    t.integer "responder_id",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string "name",  :null => false
    t.string "email", :null => false
  end

end
