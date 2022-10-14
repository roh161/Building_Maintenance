# frozen_string_literal: true

class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :apartment
      t.string :latefee
      t.string :lift
      t.string :parking_floor
      t.string :floor
      t.string :maintenance_cost
      t.string :equipment
      t.belongs_to :user

      t.timestamps
    end
  end
end
