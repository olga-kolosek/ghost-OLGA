class User < ApplicationRecord
  rolify
  resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
     	:recoverable, :rememberable, :validatable

  enum role: [:admin, :author, :editor]

  def admin?
  	has_role?(:admin)
  end
 	
end
