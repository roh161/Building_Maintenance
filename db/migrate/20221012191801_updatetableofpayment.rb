# frozen_string_literal: true

# table for change data type
class Updatetableofpayment < ActiveRecord::Migration[7.0]
  def up
    change_column :payments, :amount, :integer
  end

  def down
    change_column :payments, :amount, :string
  end
end
