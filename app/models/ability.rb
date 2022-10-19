# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      case user.role.downcase
      when 'admin'
        can :manage, :all
      when 'building owner'
        can :read, User
        can %i[create read update destroy], Building, user_id: user.id
        can %i[create read update destroy], Staff
        can %i[read update destroy], Maintenance
        can [:read], Account
      when 'client'
        can :read, Building
        can %i[create read update destroy], Maintenance, user_id: user.id
      end
    end
  end
end
