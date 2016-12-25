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

ActiveRecord::Schema.define(version: 20161222150102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "announcaments", force: :cascade do |t|
    t.string   "city"
    t.integer  "req_count",  default: 0
    t.text     "body"
    t.integer  "company_id"
    t.integer  "worker_id"
    t.string   "title"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["company_id"], name: "index_announcaments_on_company_id", using: :btree
    t.index ["worker_id"], name: "index_announcaments_on_worker_id", using: :btree
  end

  create_table "announcaments_seasons", id: false, force: :cascade do |t|
    t.integer "announcament_id",                null: false
    t.integer "season_id",                      null: false
    t.boolean "availability",    default: true
    t.index ["announcament_id", "season_id"], name: "index_announcaments_seasons_on_announcament_id_and_season_id", using: :btree
    t.index ["season_id", "announcament_id"], name: "index_announcaments_seasons_on_season_id_and_announcament_id", using: :btree
  end

  create_table "announcaments_skills", id: false, force: :cascade do |t|
    t.integer "announcament_id", null: false
    t.integer "skill_id",        null: false
    t.index ["announcament_id", "skill_id"], name: "index_announcaments_skills_on_announcament_id_and_skill_id", using: :btree
    t.index ["skill_id", "announcament_id"], name: "index_announcaments_skills_on_skill_id_and_announcament_id", using: :btree
  end

  create_table "appointments", force: :cascade do |t|
    t.text     "body"
    t.integer  "season_id"
    t.integer  "member_id"
    t.integer  "announcament_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["announcament_id"], name: "index_appointments_on_announcament_id", using: :btree
    t.index ["member_id"], name: "index_appointments_on_member_id", using: :btree
    t.index ["season_id"], name: "index_appointments_on_season_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "email",                       default: "", null: false
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "slug"
    t.string   "name"
    t.text     "bio"
    t.string   "company_poster_file_name"
    t.string   "company_poster_content_type"
    t.integer  "company_poster_file_size"
    t.datetime "company_poster_updated_at"
    t.string   "company_icon_file_name"
    t.string   "company_icon_content_type"
    t.integer  "company_icon_file_size"
    t.datetime "company_icon_updated_at"
    t.index ["email"], name: "index_companies_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_companies_on_slug", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "slug"
    t.string   "name"
    t.string   "lastname"
    t.string   "phone"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.index ["email"], name: "index_members_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_members_on_slug", unique: true, using: :btree
  end

  create_table "members_skills", id: false, force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "skill_id",  null: false
    t.index ["member_id", "skill_id"], name: "index_members_skills_on_member_id_and_skill_id", using: :btree
    t.index ["skill_id", "member_id"], name: "index_members_skills_on_skill_id_and_member_id", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "worker_id"
    t.index ["worker_id"], name: "index_seasons_on_worker_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "color"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "skill_icon_file_name"
    t.string   "skill_icon_content_type"
    t.integer  "skill_icon_file_size"
    t.datetime "skill_icon_updated_at"
  end

  create_table "skills_workers", id: false, force: :cascade do |t|
    t.integer "worker_id", null: false
    t.integer "skill_id",  null: false
    t.index ["skill_id", "worker_id"], name: "index_skills_workers_on_skill_id_and_worker_id", using: :btree
    t.index ["worker_id", "skill_id"], name: "index_skills_workers_on_worker_id_and_skill_id", using: :btree
  end

  create_table "workerpools", force: :cascade do |t|
    t.boolean  "status",     default: false
    t.integer  "company_id"
    t.integer  "worker_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["company_id"], name: "index_workerpools_on_company_id", using: :btree
    t.index ["worker_id"], name: "index_workerpools_on_worker_id", using: :btree
  end

  create_table "workers", force: :cascade do |t|
    t.string   "email",                     default: "",    null: false
    t.string   "encrypted_password",        default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "slug"
    t.string   "name"
    t.string   "lastname"
    t.boolean  "confirmation",              default: false
    t.text     "description"
    t.integer  "company_id"
    t.string   "worker_image_file_name"
    t.string   "worker_image_content_type"
    t.integer  "worker_image_file_size"
    t.datetime "worker_image_updated_at"
    t.index ["company_id"], name: "index_workers_on_company_id", using: :btree
    t.index ["email"], name: "index_workers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_workers_on_slug", unique: true, using: :btree
  end

  add_foreign_key "announcaments", "companies"
  add_foreign_key "announcaments", "workers"
  add_foreign_key "appointments", "announcaments"
  add_foreign_key "appointments", "members"
  add_foreign_key "appointments", "seasons"
  add_foreign_key "workerpools", "companies"
  add_foreign_key "workerpools", "workers"
  add_foreign_key "workers", "companies"
  create_trigger("workers_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("workers").
      after(:insert) do
    <<-SQL_ACTIONS
INSERT INTO workerpools (status, company_id, worker_id,created_at,updated_at) VALUES
                        (false, NEW.company_id, NEW.id, NEW.created_at, NEW.created_at );
    SQL_ACTIONS
  end

  create_trigger("appointments_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("appointments").
      after(:insert) do
    <<-SQL_ACTIONS
UPDATE announcaments_seasons SET availability = false WHERE
      announcament_id = NEW.announcament_id AND season_id = NEW.season_id;
    SQL_ACTIONS
  end

end
