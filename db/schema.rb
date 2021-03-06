# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_29_201640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "followings", force: :cascade do |t|
    t.bigint "podcast_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["podcast_id"], name: "index_followings_on_podcast_id"
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "podcast_tags", force: :cascade do |t|
    t.bigint "podcast_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["podcast_id"], name: "index_podcast_tags_on_podcast_id"
    t.index ["tag_id"], name: "index_podcast_tags_on_tag_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "twitter"
    t.string "patreon"
    t.string "instagram"
    t.string "facebook"
    t.string "description"
    t.boolean "adult_content"
    t.string "photo"
    t.bigint "user_id"
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "podcast_uri"
    t.index ["user_id"], name: "index_podcasts_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "access_token"
    t.string "refresh_token"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "uid"
  end

  add_foreign_key "followings", "podcasts"
  add_foreign_key "followings", "users"
  add_foreign_key "podcast_tags", "podcasts"
  add_foreign_key "podcast_tags", "tags"
  add_foreign_key "podcasts", "users"
end
