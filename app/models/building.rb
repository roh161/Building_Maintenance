# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :staffs, dependent: :destroy
  has_many :clients, class_name: 'User', dependent: :destroy
  belongs_to :user
  has_many :payments, dependent: :destroy

  validates :name, :floor, :parking_floor, :maintenance_cost, :apartment, :lift,
            presence: { message: 'must be given please' }
end
