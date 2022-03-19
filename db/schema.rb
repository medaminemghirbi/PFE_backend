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

ActiveRecord::Schema[7.0].define(version: 2022_03_14_205920) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.date "dateDebut"
    t.date "dateFin"
    t.string "ecole"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string "dateDebut"
    t.string "dateFin"
    t.string "jobType"
    t.string "description"
    t.string "entreprise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "missions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "duration"
    t.date "beginingDate"
    t.boolean "completed"
    t.string "contrat"
    t.string "postulated"
    t.string "filepath"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "commentClient"
    t.string "commentFreelancer"
    t.integer "id_mission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "lastname", null: false
    t.string "firstname", null: false
    t.string "email", null: false
    t.string "adresse"
    t.date "birthday"
    t.string "password_digest"
    t.string "sexe"
    t.float "rating"
    t.integer "phone"
    t.string "job"
    t.string "description"
    t.string "photo"
    t.integer "earning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
  end

end
