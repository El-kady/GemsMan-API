class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_admin?
      can :manage, :all
    else
      can :manage, RubyGem, :user_id => user.id
    end
  end
end
