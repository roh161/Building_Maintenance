# frozen_string_literal: true

class CreateMaintenances < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenances do |t|
      t.string :issue_type
      t.string :description
      t.string :owner_comment
      t.belongs_to :user
      t.timestamps
    end
  end
end
