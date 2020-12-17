class StoryPolicy < ApplicationPolicy
class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.editor?
        scope.all
      else
        scope.where(user: user)
      end
    end

    private

    attr_reader :user, :scope
  end


  def index?
    true
  end
 
  def create? 
    user.present?
  end
 
  def update?
    return true if user.present? && user == story.user
  end
 
  def destroy?
    return true if user.present? && user == story.user
  end
 
  private
 
    def story
      record
    end

end


