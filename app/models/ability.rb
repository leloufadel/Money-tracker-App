class Ability
  include CanCan::Ability

  def initialize(current_user)
    user = current_user || User.new

    can :manage, Category, user_id: user.id
    can :manage, Purchase, author_id: user.id
  end
end
