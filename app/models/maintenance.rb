# frozen_string_literal: true

class Maintenance < ApplicationRecord
  belongs_to :user

  validates :issue_type, :description, presence: true
end
