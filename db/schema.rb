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

ActiveRecord::Schema.define(:version => 20130501190714) do

  create_table "classifications", :force => true do |t|
    t.string   "name"
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "code"
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "year"
    t.integer  "semester_id"
    t.integer  "course_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sections", ["course_id"], :name => "index_sections_on_course_id"
  add_index "sections", ["semester_id"], :name => "index_sections_on_semester_id"

  create_table "semesters", :force => true do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "netid"
    t.string   "image"
    t.integer  "section_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "classification_id"
  end

  add_index "students", ["section_id"], :name => "index_students_on_section_id"

end
