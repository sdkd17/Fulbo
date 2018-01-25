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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180124153752) do

  create_table "anotados", force: :cascade do |t|
    t.integer "user_id"
    t.integer "partido_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "aceptado"
    t.index ["partido_id"], name: "index_anotados_on_partido_id"
    t.index ["user_id", "partido_id"], name: "index_anotados_on_user_id_and_partido_id", unique: true
    t.index ["user_id"], name: "index_anotados_on_user_id"
  end

  create_table "partidos", force: :cascade do |t|
    t.integer "user_id"
    t.string "lugar"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_partidos_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "follower_id"
    t.string "integer"
    t.string "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nick"
    t.string "password"
    t.string "nombre"
    t.string "apellido"
    t.date "nacimiento"
    t.text "descripcion"
    t.integer "calificacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "email"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nick"], name: "index_users_on_nick", unique: true
  end

end
