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

def admin_status(user)
  admincheck = memberships.where(user_id: user.id).first
  admincheck.admin
end


end
