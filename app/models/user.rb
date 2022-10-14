# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  has_many :buildings
  has_many :maintenances
  has_one :building
  has_many :payments

  def change_user_to_paid
    update(membership: 1)
  end
end
