class Group < ApplicationRecord

  mount_uploader :image, ImageUploader
  belongs_to :event_setting, optional:true
  validates :name, presence:true
  validates :location, presence:true
  validate :latitude_require

def latitude_require
  errors.add(:base, 'Please select a location from the autocomplete. Group locations can be as broad as you like and do not require a street address') unless latitude.present?
end


end
