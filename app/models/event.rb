class Event < ApplicationRecord
  belongs_to :group
  belongs_to :venue, optional: true
  belongs_to :event_setting, optional: true
  belongs_to :session, optional: true
  has_many :attendances
  has_many :users, :through => :attendances

  validate :date_not_gone
  validates :start_time, :duration, :date, :name,  presence:true

  scope :mine, -> (current_user_id){joins(:users).where(users:{id: current_user_id})}
  scope :group_name_search, -> (search_string){joins(:group).where('events.name LIKE ? OR groups.name LIKE ?', "%#{search_string}%", "%#{search_string}%") if search_string.present?}
  scope :upcoming, ->{where("Date > ?", (Date.today - 1.days))}
  
  private
  
  def date_not_gone
    errors.add(:base, "Event can't be in the past") unless date.future? || (date.today? && start_time.utc.strftime( "%H%M" ) > Time.now.utc.strftime( "%H%M" )) if date && start_time
  end
end
