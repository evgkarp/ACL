class ApplicationPolicy
  attr_reader :user, :permissible

  def initialize(user, permissible)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user
    @user = user
    @permissible = permissible
  end

  def show?
    @user.can_read?(@permissible) || update?
  end

  def update?
    @user.can_write?(@permissible)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
