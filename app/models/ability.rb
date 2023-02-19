class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Pet
  end

end
