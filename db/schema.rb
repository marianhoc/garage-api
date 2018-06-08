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

ActiveRecord::Schema.define(version: 20180605174237) do

  create_table "cards", force: :cascade do |t|
    t.integer "normal_user_id"
    t.string "numero"
    t.string "titular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["normal_user_id"], name: "index_cards_on_normal_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "normal_user_id"
    t.string "cor"
    t.string "placa"
    t.string "modelo"
    t.string "marca"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["normal_user_id"], name: "index_cars_on_normal_user_id"
  end

  create_table "credits", force: :cascade do |t|
    t.integer "normal_user_id"
    t.bigint "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nota_fiscal"
    t.index ["normal_user_id"], name: "index_credits_on_normal_user_id"
  end

  create_table "dono_estacionamentos", force: :cascade do |t|
    t.integer "user_id"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dono_estacionamentos_on_user_id"
  end

  create_table "estacionamentos", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "telefone"
    t.string "razao_social"
    t.string "cnpj"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "primeira_hora"
    t.float "hora"
    t.float "mensal"
    t.boolean "aberto"
    t.integer "dono_estacionamentos_id"
    t.index ["dono_estacionamentos_id"], name: "index_estacionamentos_on_dono_estacionamentos_id"
  end

  create_table "lojas", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "latitude"
    t.string "longitude"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_owner_id"
    t.index ["store_owner_id"], name: "index_lojas_on_store_owner_id"
  end

  create_table "normal_users", force: :cascade do |t|
    t.bigint "balance", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "placa"
    t.string "cpf"
    t.index ["user_id"], name: "index_normal_users_on_user_id"
  end

  create_table "partners", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_partners_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "normal_user_id"
    t.integer "estacionamento_id"
    t.string "status"
    t.boolean "car_at_vacancy"
    t.datetime "programming_date_begin"
    t.datetime "programming_date_end"
    t.integer "expected_time_at_vacancy"
    t.integer "real_time_at_vacancy"
    t.float "tax_value"
    t.float "total_value"
    t.string "payment"
    t.boolean "creditos_pare_mais"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "car_id"
    t.index ["car_id"], name: "index_reservations_on_car_id"
    t.index ["estacionamento_id"], name: "index_reservations_on_estacionamento_id"
    t.index ["normal_user_id"], name: "index_reservations_on_normal_user_id"
  end

  create_table "store_owners", force: :cascade do |t|
    t.integer "user_id"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_store_owners_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "birth"
    t.integer "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "lastname"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacancies", force: :cascade do |t|
    t.integer "estacionamento_id"
    t.integer "normal_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estacionamento_id"], name: "index_vacancies_on_estacionamento_id"
    t.index ["normal_user_id"], name: "index_vacancies_on_normal_user_id"
  end

end
