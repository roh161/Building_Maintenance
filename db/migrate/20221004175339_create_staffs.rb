# frozen_string_literal: true

class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :salary
      t.belongs_to :building
      t.timestamps
    end
  end
end
