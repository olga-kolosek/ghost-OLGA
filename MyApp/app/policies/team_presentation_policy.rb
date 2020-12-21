class TeamPresentationPolicy < ApplicationPolicy
  def index?
    user.admin? && user.deleted_at == nil
  end

  def new
    TeamPresentation.count == 0
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

  def team_presentation
    record
  end 
end