class TeamControllerPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    private

    attr_reader :user, :scope
  end


  def index?
    user.admin? && user.deleted_at == nil
  end

  def create? 
    user.present? && user.deleted_at == nil
  end

  def update?
    user.present? && user.admin? && user.deleted_at == nil
  end

  def destroy?
    user.present? && user.admin? && user.deleted_at == nil
  end

  private

  def team
    record
  end

end


