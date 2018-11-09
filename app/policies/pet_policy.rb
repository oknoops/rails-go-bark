class PetPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

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

  def search?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
