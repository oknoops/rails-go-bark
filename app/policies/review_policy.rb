class ReviewPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    if record.user == user || user.admin
      true
    else
      false
    end
  end

  def destroy?
    if record.user == user || user.admin
      true
    else
      false
    end
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
