class Event < ApplicationRecord
  belongs_to :group
  belongs_to :venue, optional: true
  belongs_to :event_setting, optional: true
  belongs_to :session, optional: true

  validate :date_not_gone
  validates :start_time, :end_time, :date, :name,  presence:true
  


  private
  
  def date_not_gone
    errors.add(:base, "Event can't be in the past") unless date.future? || (date.today? && start_time > Time.now)
  end
end
