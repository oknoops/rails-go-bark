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
    record == user
<<<<<<< HEAD
=======
  end

  def destroy?
    record == user
>>>>>>> 30ce0fa68a47c38e34e424eddb7b7c154a96cf1f
  end


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
