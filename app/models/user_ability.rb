class UserAbility
  include CanCan::Ability

  def initialize(user)

    if user.admin?
      can :manage, :all
    elsif user.organization?
      can :manage, :all

    elsif user.general?
      can :manage, :all
      cannot :update, Pet
      cannot :create, Pet
      cannot :destroy, Pet
    else
      can :read, Pet
    end
  end
end
