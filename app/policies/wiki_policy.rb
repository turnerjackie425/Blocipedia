class WikiPolicy < ApplicationPolicy


class Scope
  attr_reader :user, :scope

  def initialize(user, scope)
    @user = user
    @scope = scope
  end

  def resolve
    if user.admin? || user.premium?
      scope.all? 
    else
      scope.where(:authorize => true)
    end
  end
end
 
  def new
    create?
  end

  def index?
    true
  end

  def create?
    user.present? 
  end
  
  def update?
    create?
  end

  def show?
    user.present?
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.premium?)
  end
end