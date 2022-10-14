# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_221_012_191_801) do
  create_table 'accounts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'building_balance'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'buildings', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.string 'apartment'
    t.string 'latefee'
    t.string 'lift'
    t.string 'parking_floor'
    t.string 'floor'
    t.string 'maintenance_cost'
    t.string 'equipment'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_buildings_on_user_id'
  end

  create_table 'maintenances', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'issue_type'
    t.string 'description'
    t.string 'owner_comment'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_maintenances_on_user_id'
  end

  create_table 'payments', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'amount'
    t.bigint 'user_id'
    t.bigint 'building_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['building_id'], name: 'index_payments_on_building_id'
    t.index ['user_id'], name: 'index_payments_on_user_id'
  end

  create_table 'staffs', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.string 'salary'
    t.bigint 'building_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['building_id'], name: 'index_staffs_on_building_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'name'
    t.string 'role', default: 'client'
    t.bigint 'building_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'stripe_customer_id'
    t.integer 'membership', default: 0
    t.index ['building_id'], name: 'index_users_on_building_id'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
