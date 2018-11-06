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
<<<<<<< HEAD
=======
=======
>>>>>>> e0f2ad6534aa3dec844a6563ce7410de00a66b98
  end

  def destroy?
    record == user
<<<<<<< HEAD
>>>>>>> 30ce0fa68a47c38e34e424eddb7b7c154a96cf1f
=======
>>>>>>> e0f2ad6534aa3dec844a6563ce7410de00a66b98
  end


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
