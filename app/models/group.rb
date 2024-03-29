class Group < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :event_setting, optional:true
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :events

  validates :name, presence:true
  validates :location, presence:true
  validate :latitude_require
  validates :location, length: {maximum: 500 }
  validates :name, length: { maximum: 50 }

  scope :mine, -> (current_user_id){joins(:users).where(users:{id: current_user_id})}
  scope :name_search, -> (search_string){where("name LIKE ?", "%#{search_string.to_s}%")}
  scope :admin_of, -> (user_id){joins(:users).where(users:{id: user_id}, memberships:{admin: true})}

  def latitude_require
    errors.add(:base, 'Please select a location from the autocomplete. Group locations can be as broad as you like and do not require a street address') unless latitude.present?
  end

  def get_membership(user)
    member = memberships.where(user_id: user.id).first
  end

  def check_groups_shown(user)
    memberships.any? {|member| member.user_id == user.id} 
  end

  def admin_status(user)
    if (membership = memberships.where(user_id: user.id).first)
      puts "USER ID #{membership[:user_id]}"
      membership[:admin]
    else
      return false
    end
  end

  def member_count
    member_count = memberships.count
  end

  def has_event(date)
    events.each do |e| 
      if e.date.strftime("%D%M%Y") == date.strftime("%D%M%Y")
        return e
      end
    end
    return false
  end

end
