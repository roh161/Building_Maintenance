# frozen_string_literal: true

# table for payments
class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :amount
      t.belongs_to :user
      t.belongs_to :building
      t.timestamps
    end
  end
end
