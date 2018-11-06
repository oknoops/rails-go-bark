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
    record.user == user
  end


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
