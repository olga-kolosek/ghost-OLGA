  class User < ApplicationRecord
  rolify
  resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable, :invitable, invite_for: 7.days
      
  # attr_accessible :image, :remote_image_url
  mount_uploader :image, ImageUploader    

  enum role: [:admin, :author, :editor]


  def admin?
    has_role?(:admin)
  end

  def set_role 
    User.count == 1 ? self.role = :admin : self.role = :author
    self.save
  end

  def update_last_seen
    self.last_seen_at = Time.current
    self.save
  end
    
end