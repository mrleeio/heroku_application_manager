# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_18_035640) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "client_type", ["private_equity", "real_estate"]

  create_table "heroku_applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "application_name", null: false
    t.string "client_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "client_type", default: "private_equity", null: false, enum_type: "client_type"
    t.index ["application_name"], name: "index_heroku_applications_on_application_name", unique: true
    t.index ["client_name"], name: "index_heroku_applications_on_client_name", unique: true
  end

end
