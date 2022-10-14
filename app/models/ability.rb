# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user) 
    return unless user.present?  # additional permissions for logged in users (they can read their own posts)
    can :read, Building, user: user
    can :read, Maintenance, user: user

    return unless user.admin?  # additional permissions for administrators
    can :manage, :all
  end
end