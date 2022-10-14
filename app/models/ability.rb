# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)  
    if user.present?
      if user.role == "admin"
        can :manage, :all
      elsif user.role == "building owner"
        can :manage, :all, user_id:user.id
      elsif user.role == "client"
        can :read, :all
      end
    end
  end
end