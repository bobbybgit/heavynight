class Group < ApplicationRecord

  mount_uploader :image, ImageUploader
  belongs_to :event_setting, optional:true
  has_many :memberships
  has_many :users, :through => :memberships
  validates :name, presence:true
  validates :location, presence:true
  validate :latitude_require
  validates :location, length: {maximum: 500 }
  validates :name, length: { maximum: 50 }

  def latitude_require
    errors.add(:base, 'Please select a location from the autocomplete. Group locations can be as broad as you like and do not require a street address') unless latitude.present?
  end

  def get_membership(user)
    member = memberships.where(user_id: user.id).first
  end

  def admin_status(user)
    if (membership = Membership.where(user_id: user.id).first)
      puts "USER ID #{membership[:user_id]}"
      membership[:admin]
    else
      return false
    end
  end

  def member_count
    member_count = memberships.count
  end

end
