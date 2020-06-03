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
    edit?
  end

  def edit?
    user.author == 1
  end

  def destroy?
    index?
  end

  class Scope < Scope
    def resolve
      if user.author == 1
        scope.all
      else
        scope.where("created_at >= #{DateTime.now.strftime('%Y/%m/%d')}")
      end
    end
  end
end