class SongPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user.id == current_user.id
  end

  def destroy?
    record.user.id == current_user.id
  end
end
