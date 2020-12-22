class StoryPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.deleted_at == nil && user.present?
        user.admin? || user.editor? ? scope.all : scope.where(user: user)
      end
    end


    private

    attr_reader :user, :scope
  end


  def index?
    user.deleted_at == nil && user.present?
  end

  def create? 
    user.present?
  end

  def update?
    user.present? && user == story.user
  end

  def destroy?
    user.present? && user == story.user
  end

  private

  def story
    record
  end

end


