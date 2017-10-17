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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151002163328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adverts", force: true do |t|
    t.string   "title",       limit: nil
    t.string   "description", limit: nil
    t.integer  "clicks",      limit: 8
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "authentication_providers", force: true do |t|
    t.string   "name",       limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authentication_providers", ["name"], name: "index_name_on_authentication_providers", using: :btree

  create_table "categories", force: true do |t|
    t.string   "title",       limit: nil
    t.integer  "category_id"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug",        limit: nil
  end

  create_table "channel_members", force: true do |t|
    t.integer  "channel_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels", force: true do |t|
    t.string   "title",      limit: nil
    t.text     "content"
    t.string   "logo",       limit: nil
    t.string   "background", limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "companies", force: true do |t|
    t.string   "title",       limit: nil
    t.text     "description"
    t.string   "logo",        limit: nil
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "features", force: true do |t|
    t.string   "image_a",    limit: nil
    t.string   "image_b",    limit: nil
    t.integer  "post_id"
    t.boolean  "published"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "forem_categories", force: true do |t|
    t.string   "name",       limit: nil,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: nil
    t.integer  "position",               default: 0
  end

  add_index "forem_categories", ["slug"], name: "index_forem_categories_on_slug", unique: true, using: :btree

  create_table "forem_forums", force: true do |t|
    t.string  "name",        limit: nil
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count",             default: 0
    t.string  "slug",        limit: nil
    t.integer "position",                default: 0
  end

  add_index "forem_forums", ["slug"], name: "index_forem_forums_on_slug", unique: true, using: :btree

  create_table "forem_groups", force: true do |t|
    t.string "name", limit: nil
  end

  add_index "forem_groups", ["name"], name: "index_forem_groups_on_name", using: :btree

  create_table "forem_memberships", force: true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], name: "index_forem_memberships_on_group_id", using: :btree

  create_table "forem_moderator_groups", force: true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], name: "index_forem_moderator_groups_on_forum_id", using: :btree

  create_table "forem_posts", force: true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_id"
    t.string   "state",       limit: nil, default: "pending_review"
    t.boolean  "notified",                default: false
  end

  add_index "forem_posts", ["reply_to_id"], name: "index_forem_posts_on_reply_to_id", using: :btree
  add_index "forem_posts", ["state"], name: "index_forem_posts_on_state", using: :btree
  add_index "forem_posts", ["topic_id"], name: "index_forem_posts_on_topic_id", using: :btree
  add_index "forem_posts", ["user_id"], name: "index_forem_posts_on_user_id", using: :btree

  create_table "forem_subscriptions", force: true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject",      limit: nil
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",                   default: false,            null: false
    t.boolean  "pinned",                   default: false
    t.boolean  "hidden",                   default: false
    t.datetime "last_post_at"
    t.string   "state",        limit: nil, default: "pending_review"
    t.integer  "views_count",              default: 0
    t.string   "slug",         limit: nil
  end

  add_index "forem_topics", ["forum_id"], name: "index_forem_topics_on_forum_id", using: :btree
  add_index "forem_topics", ["slug"], name: "index_forem_topics_on_slug", unique: true, using: :btree
  add_index "forem_topics", ["state"], name: "index_forem_topics_on_state", using: :btree
  add_index "forem_topics", ["user_id"], name: "index_forem_topics_on_user_id", using: :btree

  create_table "forem_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",                         default: 0
    t.string   "viewable_type",     limit: nil
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], name: "index_forem_views_on_updated_at", using: :btree
  add_index "forem_views", ["user_id"], name: "index_forem_views_on_user_id", using: :btree
  add_index "forem_views", ["viewable_id"], name: "index_forem_views_on_viewable_id", using: :btree

  create_table "game_developers", force: true do |t|
    t.integer  "game_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_genres", force: true do |t|
    t.integer "game_id"
    t.integer "genre_id"
  end

  create_table "game_platforms", force: true do |t|
    t.integer "game_id"
    t.integer "platform_id"
  end

  create_table "game_publishers", force: true do |t|
    t.integer  "game_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: true do |t|
    t.string   "title",      limit: nil
    t.text     "content"
    t.string   "cover",      limit: nil
    t.string   "background", limit: nil
    t.datetime "date"
    t.decimal  "score",                  precision: 10, scale: 1
    t.decimal  "ext_score",              precision: 10, scale: 1
    t.decimal  "user_score",             precision: 10, scale: 1
    t.text     "mature"
    t.string   "status",     limit: nil
    t.integer  "views",      limit: 8
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "genres", force: true do |t|
    t.string   "title",       limit: nil
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "image_comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: true do |t|
    t.string   "type",        limit: nil
    t.string   "description", limit: nil
    t.string   "file",        limit: nil
    t.integer  "views",       limit: 8
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "options", force: true do |t|
    t.string   "type",       limit: nil
    t.string   "name",       limit: nil
    t.text     "value"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pages", force: true do |t|
    t.string   "title",      limit: nil
    t.text     "content"
    t.string   "status",     limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "platforms", force: true do |t|
    t.string   "shortname",  limit: nil
    t.string   "name",       limit: nil
    t.string   "logo",       limit: nil
    t.string   "background", limit: nil
    t.text     "content"
    t.datetime "date"
    t.string   "status",     limit: nil
    t.integer  "views",      limit: 8
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "poll_options", force: true do |t|
    t.integer  "poll_id"
    t.string   "name",       limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "poll_options", ["poll_id"], name: "index_poll_options_on_poll_id", using: :btree

  create_table "poll_votes", force: true do |t|
    t.integer  "poll_id"
    t.integer  "poll_option_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "ip"
  end

  add_index "poll_votes", ["poll_id"], name: "index_poll_votes_on_poll_id", using: :btree
  add_index "poll_votes", ["poll_option_id"], name: "index_poll_votes_on_poll_option_id", using: :btree
  add_index "poll_votes", ["user_id"], name: "index_poll_votes_on_user_id", using: :btree

  create_table "polls", force: true do |t|
    t.string   "title",      limit: nil
    t.string   "slug",       limit: nil
    t.string   "status",     limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "post_comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_games", force: true do |t|
    t.integer "post_id"
    t.integer "game_id"
  end

  create_table "post_platforms", force: true do |t|
    t.integer "post_id"
    t.integer "platform_id"
  end

  create_table "posts", force: true do |t|
    t.string   "title",       limit: nil
    t.text     "content"
    t.integer  "image_id"
    t.string   "background",  limit: nil
    t.datetime "date"
    t.string   "status",      limit: nil
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "views",       limit: 8
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name",          limit: nil
    t.integer  "resource_id"
    t.string   "resource_type", limit: nil
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "slides", force: true do |t|
    t.string   "category",   limit: nil
    t.string   "title",      limit: nil
    t.string   "image",      limit: nil
    t.boolean  "published"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_authentications", force: true do |t|
    t.integer  "user_id"
    t.integer  "authentication_provider_id"
    t.string   "uid",                        limit: nil
    t.string   "token",                      limit: nil
    t.datetime "token_expires_at"
    t.text     "params"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "user_authentications", ["authentication_provider_id"], name: "index_user_authentications_on_authentication_provider_id", using: :btree
  add_index "user_authentications", ["user_id"], name: "index_user_authentications_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                   limit: nil
    t.text     "description"
    t.string   "avatar",                 limit: nil
    t.string   "background",             limit: nil
    t.date     "birthday"
    t.string   "gender",                 limit: nil
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "email",                  limit: nil, default: "",               null: false
    t.string   "encrypted_password",     limit: nil, default: "",               null: false
    t.string   "reset_password_token",   limit: nil
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: nil
    t.string   "last_sign_in_ip",        limit: nil
    t.string   "provider",               limit: nil
    t.string   "uid",                    limit: nil
    t.boolean  "forem_admin",                        default: false
    t.string   "forem_state",            limit: nil, default: "pending_review"
    t.boolean  "forem_auto_subscribe",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "video_comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: true do |t|
    t.string   "canal",       limit: nil
    t.string   "provider",    limit: nil
    t.string   "title",       limit: nil
    t.text     "description"
    t.string   "vid",         limit: nil
    t.integer  "views",       limit: 8
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "videos", ["game_id"], name: "index_videos_on_game_id", using: :btree
  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree

end
