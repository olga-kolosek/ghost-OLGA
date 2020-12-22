class SettingPolicy < ApplicationPolicy
  def index?
    user.admin? && user.deleted_at == nil
  end

  def new?
    user.admin?
  end

  def create? 
    user.present? && user.deleted_at == nil && user.admin?
  end

  def update?
    user.present? && user.admin? && user.deleted_at == nil
  end

  def destroy?
    user.present? && user.admin? && user.deleted_at == nil
  end

  private

  def setting
    record
  end 
end