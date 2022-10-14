# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :staffs
  has_many :clients, class_name: 'User'
  belongs_to :user
  has_many :payments

  validates :name, :floor, :parking_floor, :maintenance_cost, :apartment, :lift,
            presence: { message: 'must be given please' }
end
