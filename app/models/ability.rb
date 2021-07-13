class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    elsif user.seller?
      can :read, Store
      can :create, Store
      can :update, Store do |store|
        store.try(:user) == user
      end
      can :destroy, Store do |store|
        store.try(:user) == user
      end
    elsif user.regular?
      can :read, Store
    else
      can :read, Store
    end
  end
end
