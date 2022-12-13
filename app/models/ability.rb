class Ability
  include CanCan::Ability
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.confirmed_at?
      can :manage, :all
      can :destroy, Recipe do |recipe|
        recipe.user_id == user.id
      end
    else
      can :read, :all
    end
  end
end
