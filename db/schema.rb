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

ActiveRecord::Schema.define(version: 20171107213736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hashtags", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag"], name: "index_hashtags_on_tag", unique: true
  end

  create_table "hashtags_tweets", id: false, force: :cascade do |t|
    t.bigint "hashtag_id"
    t.bigint "tweet_id"
    t.index ["hashtag_id"], name: "index_hashtags_tweets_on_hashtag_id"
    t.index ["tweet_id"], name: "index_hashtags_tweets_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_tweets_on_created_at"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_users", id: false, force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followee_id"
    t.index ["followee_id"], name: "index_users_users_on_followee_id"
    t.index ["follower_id"], name: "index_users_users_on_follower_id"
  end

  add_foreign_key "tweets", "users"
  add_foreign_key "users_users", "users", column: "followee_id"
  add_foreign_key "users_users", "users", column: "follower_id"
end
