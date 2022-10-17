# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  has_many :buildings, dependent: :destroy
  has_many :maintenances, dependent: :destroy
  has_one :building, dependent: :destroy
  has_many :payments

  validates :name, :role, presence: true

  def change_user_to_paid
    update(membership: 1)
  end
end
