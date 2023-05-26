class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :user_image, UserImageUploader

  


  validates_presence_of :first_name
  validates_presence_of :surname

  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :attendances
  has_many :events, :through => :attendances

  scope :members, -> (group){joins(:groups).where(groups:{id: group})}

  def member?(group)
    groups.exists?(group.id)
  end
  
end
