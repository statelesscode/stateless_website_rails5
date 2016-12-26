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

ActiveRecord::Schema.define(version: 20161212035716) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.integer  "author_user_id"
    t.string   "topic"
    t.string   "status"
    t.text     "body"
    t.string   "description",           limit: 150
    t.text     "keywords"
    t.string   "minified_link"
    t.datetime "published_at"
    t.datetime "post_last_modified_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["author_user_id"], name: "index_articles_on_author_user_id"
    t.index ["description"], name: "index_articles_on_description"
    t.index ["status"], name: "index_articles_on_status"
    t.index ["title"], name: "index_articles_on_title"
    t.index ["topic"], name: "index_articles_on_topic"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commenter_user_id"
    t.text     "body"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["commenter_user_id"], name: "index_comments_on_commenter_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "",       null: false
    t.string   "role",                   default: "Public", null: false
    t.boolean  "email_subscriber",       default: true
    t.string   "subscription_class",     default: "Public"
    t.string   "user_class",             default: "User"
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,        null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["email_subscriber"], name: "index_users_on_email_subscriber"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["subscription_class"], name: "index_users_on_subscription_class"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["user_class"], name: "index_users_on_user_class"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
