# frozen_string_literal: true

class Staff < ApplicationRecord
  belongs_to :building

  validates :name, :salary, presence: true
end
