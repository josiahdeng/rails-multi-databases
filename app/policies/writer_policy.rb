class WriterPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    new?
  end

  def new?
    user.present?
  end

  def update?
    index?
  end

  def edit?
    index?
  end

  def destroy?
    index?
  end

  class Scope < Scope
    def resolve
      if user.author == 1
        scope.unscope(where: :deleted)
      else
        scope.all
      end
    end
  end
end