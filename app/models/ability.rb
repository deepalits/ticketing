class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    @user_role = @user&.role
    if @user_role
      public_send(@user_role.name)
    else
      unauthorize_index_access
    end
  end

  def admin
    can :manage, [Event, User, UserEvent]
  end

  def guest
    can :read, Event
    can %i[create new], User
    can :manage, UserEvent
    can :manage, Order
  end

  def unauthorize_index_access
    can %i[index show], Event
  end
end
