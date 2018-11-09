class UserPolicy < ApplicationPolicy

  def new?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    if record == user || user.admin
      true
    else
      false
    end
  end

  def destroy?
    if record == user || user.admin
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
