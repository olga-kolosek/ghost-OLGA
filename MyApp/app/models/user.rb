  class User < ApplicationRecord
  rolify
  resourcify
  acts_as_paranoid without_default_scope: true  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable, :invitable, invite_for: 7.days
      
  # attr_accessible :image, :remote_image_url
  mount_uploader :image, ImageUploader    

  enum role: [:admin, :author, :editor]
  has_many :stories, dependent: :destroy

  scope :last_seen, -> { where.not(last_seen_at: 2.minutes.ago..DateTime.now).or(where(:last_seen_at => nil)) }
  scope :invitation_sent, -> { where.not(:invitation_sent_at => nil)}
  scope :not_deleted_team_members, -> {where(:deleted_at => nil).where.not(:invitation_sent_at => nil) }


  def admin?
    self.try(:role) == "admin"
  end

  def author?
    self.try(:role) == "author"
  end

  def editor?
    self.try(:role) == "editor"
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