class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
      if user.admin?
        can :manage, :all
      else
        can :manage, Ad, user_id: user.id
        can :show, Ad
      end
    end
 end

