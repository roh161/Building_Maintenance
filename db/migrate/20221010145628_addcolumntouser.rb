# frozen_string_literal: true

class Addcolumntouser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :stripe_customer_id, :string
    add_column :users, :membership, :integer, default: 0
  end
end
