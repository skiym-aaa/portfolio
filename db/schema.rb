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

ActiveRecord::Schema.define(version: 2020_06_03_095927) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_bookmarks_on_place_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "room_id"
    t.index ["room_id"], name: "index_chats_on_room_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "event_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.text "body"
    t.decimal "score", precision: 5, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_comments_on_event_id"
    t.index ["user_id"], name: "index_event_comments_on_user_id"
  end

  create_table "event_photos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_photos_on_event_id"
    t.index ["user_id"], name: "index_event_photos_on_user_id"
  end

  create_table "event_registers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_registers_on_event_id"
    t.index ["user_id"], name: "index_event_registers_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "idol_id"
    t.integer "place_id"
    t.string "title"
    t.integer "genre"
    t.string "body"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idol_id"], name: "index_events_on_idol_id"
    t.index ["place_id"], name: "index_events_on_place_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "idol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idol_id"], name: "index_favorites_on_idol_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "goods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.integer "event_photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_goods_on_event_id"
    t.index ["event_photo_id"], name: "index_goods_on_event_photo_id"
    t.index ["user_id"], name: "index_goods_on_user_id"
  end

  create_table "idols", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "about"
    t.string "official_site"
    t.string "official_twitter"
    t.string "official_youtube"
    t.string "image_id"
    t.text "default_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_idols_on_user_id"
  end

  create_table "place_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "place_id"
    t.text "body"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_place_comments_on_place_id"
    t.index ["user_id"], name: "index_place_comments_on_user_id"
  end

  create_table "place_photos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "place_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_place_photos_on_place_id"
    t.index ["user_id"], name: "index_place_photos_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "address"
    t.text "about"
    t.string "official_site"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "place_photo_id"
    t.integer "event_photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "image_id"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
    t.string "provider_image_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
