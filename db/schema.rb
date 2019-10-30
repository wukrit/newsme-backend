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

ActiveRecord::Schema.define(version: 2019_10_30_190348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "headline"
    t.string "body"
    t.string "url"
    t.string "sentiment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "topics_id"
    t.bigint "sources_id"
    t.index ["sources_id"], name: "index_articles_on_sources_id"
    t.index ["topics_id"], name: "index_articles_on_topics_id"
  end

  create_table "filters", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.bigint "sources_id"
    t.index ["sources_id"], name: "index_filters_on_sources_id"
    t.index ["users_id"], name: "index_filters_on_users_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.bigint "topics_id"
    t.index ["topics_id"], name: "index_subscriptions_on_topics_id"
    t.index ["users_id"], name: "index_subscriptions_on_users_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "articles", "sources", column: "sources_id"
  add_foreign_key "articles", "topics", column: "topics_id"
  add_foreign_key "filters", "sources", column: "sources_id"
  add_foreign_key "filters", "users", column: "users_id"
  add_foreign_key "subscriptions", "topics", column: "topics_id"
  add_foreign_key "subscriptions", "users", column: "users_id"
end
