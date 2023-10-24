# frozen_string_literal: true

class Ability
  include CanCan::Ability    
    def initialize(user)
      user ||= User.new # Guest
  
      can :manage, Catagory, user_id: user.id
      can :manage, Purchase, author_id: user.id
  end
end

